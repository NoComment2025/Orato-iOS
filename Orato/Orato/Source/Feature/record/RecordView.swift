//
//  recordView.swift
//  Orato
//
//  Created by maple on 9/15/25.
//


// 검색창으로 검색하는거 recordviewmodel에 함수 만들어서 텍스트뷰에 있ㄴㄴ 버튼에 꽂아넣기
import SwiftUI
import Combine

struct recordView: View {
    @ObservedObject var recordVM : RecordViewModel
    
    @State var now_selectedTag : Tag = .all
    @State var search : String = ""

    var body: some View {
        VStack{
            CustomField(input: $search, txt: "발표의 주제를 입력하시오")
                .padding()
            
            ScrollView(.horizontal,showsIndicators: false){
                TagItem(selected:$now_selectedTag,allhidden: false)
            }
                ScrollView{
                VStack{
                    ForEach(
                        Array(recordVM.array.indices)
                            .filter { idx in
                                (search.isEmpty || recordVM.array[idx].topic.contains(search)) &&
                                (now_selectedTag == .all || now_selectedTag.rawValue == recordVM.array[idx].tag)
                            },
                        id: \.self
                    ) { idx in
                        RecordListItem(item: $recordVM.array[idx])
                    }
                }
                
            }
//            .frame(height: 640)
        }
        .task {
            await recordVM.getlist()
                
            }
        }
        
    }
        


#Preview {
    recordView(recordVM: RecordViewModel())
}
/*
 
 foreach(array, id : \.self){item in
    
 }
 
 */
