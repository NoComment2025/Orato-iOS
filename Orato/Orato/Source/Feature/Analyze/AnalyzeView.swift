import SwiftUI
import PhotosUI

struct AnalyzView: View {
    @StateObject var analyzeVM = AnalyzeViewModel()
    @State var selectedTag: Tag = .presentation
    @State private var selectedItem: PhotosPickerItem? = nil   // ✅ PhotosPicker에서 선택된 아이템
    @State private var fileURL: URL? = nil                     // ✅ URL 저장용
    @State private var isurl: Bool = false
    @State private var isalert: Bool = false
    @State var isProcessing = false
    
    let mtime = Array(0...4)
    let stime = Array(0...59)
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                CustomField(input: $analyzeVM.info.topic)
                    .padding(.bottom)
                TagItem(selected: $analyzeVM.info.tag, allhidden: true)
                
                // ✅ 영상 선택 버튼 (PhotosPicker)
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .videos,
                    photoLibrary: .shared()
                ) {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 3, dash: [6]))
                        .overlay {
                            if !isurl {
                                VStack {
                                    HStack {
                                        Image("analyze_1")
                                        Image("analyze_2")
                                    }
                                    Text("영상을 업로드하세요")
                                        .foregroundColor(.tcolor)
                                }
                            } else {
                                Text("선택된 파일: \(fileURL?.lastPathComponent ?? "없음")")
                                    .foregroundStyle(.white)
                            }
                        }
                        .frame(width: 340, height: 322)
                        .foregroundColor(.black)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        guard let newItem = newItem else { return }
                        do {
                            // ✅ 1. 영상 데이터를 Data로 로드
                            if let fileData = try await newItem.loadTransferable(type: Data.self) {
                                let sizeMB = Double(fileData.count) / (1024 * 1024)
                                
                                if sizeMB > 5000 {
                                    print("❌ 파일이 너무 큽니다 (\(sizeMB/1000)GB)")
                                    isurl = false
                                    fileURL = nil
                                    return
                                }

                                // ✅ 2. Data를 임시 파일로 저장
                                let tempURL = FileManager.default.temporaryDirectory
                                    .appendingPathComponent("selectedVideo.mov")
                                try fileData.write(to: tempURL)

                                print("✅ 임시 파일 저장됨: \(tempURL)")
                                fileURL = tempURL
                                isurl = true
                            } else {
                                print("❌ loadTransferable 실패: Data 반환 안됨")
                                isurl = false
                            }
                        } catch {
                            print("URL 로드 실패: \(error.localizedDescription)")
                            isurl = false
                        }
                    }
                }

                // ✅ 업로드 버튼
                Button {
                    guard let fileURL else {
                        isalert = true
                        return
                    }
                    Task {
                        isProcessing = true
                        await NetworkRunner.share.upload("analysis/video", fileURL: fileURL, parameter:analyzeVM.info )
                        isProcessing = false
                    }
                } label: {
                    if isProcessing {
                        ProgressView("AI 분석 중...")
                            .frame(width: 350, height: 70)
                            .background(.gray.opacity(0.4))
                            .cornerRadius(20)
                    } else {
                        Text("다음으로")
                            .frame(width: 350, height: 70)
                            .background(.tagSelected)
                            .foregroundStyle(.black)
                            .cornerRadius(20)
                    }
                }
                .alert("파일이 선택되지 않았습니다", isPresented: $isalert) {
                    Button("확인", role: .cancel) { }
                }
            }
        }
    }
}
