//
//  RecordListItem.swift
//  Orato
//
//  Created by maple on 9/16/25.
//

import SwiftUI

struct RecordListItem: View {
    @Binding var item : RecordModel
    @State private var content: String = ""
    @State var ischecked : Bool = false
    @State var sheet : Bool = false
    @State var alert : Bool = false
//    @State var tag : Tag
    var body: some View {
        Rectangle()
            .foregroundStyle(.tcolor)
            .frame(width: 356,height: 109)
            .cornerRadius(20)
            .overlay {
                VStack{
                    HStack{
                        
                        Button{
                            ischecked.toggle()
                        }label: {
                            Image(systemName:(ischecked ? "rectangle.fill" : "rectangle"))
                                .foregroundStyle(.white)
                        }
                        .frame(width: 21,height: 21)
                        .padding(.horizontal,15)
                        
                        Button{
                            if item.status == progress.success.rawValue{sheet.toggle()}
                            else{alert.toggle()}
                        }label: {
                            Text(item.topic)
                                .foregroundStyle(.white)
                        }
                        .alert("열람불가", isPresented: $alert, actions: {
                            
                        })
                        .sheet(isPresented: $sheet){
                            DetailView(content: item,alert: $alert)
                                
                        }
                        
                        Text("\($item.createdDate)")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    HStack{
                        Rectangle()
                        .frame(width: 70,height: 36)
                        .background(.tagSelected)
                        .foregroundColor(.tagSelected)
                        .cornerRadius(30)
                        .overlay {
                            Text("\(Tag(rawValue: item.tag)?.text)")
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal,15)
                        Rectangle()
                        .frame(width: 70,height: 36)
                        .background(Color.tagSelected)
                        .foregroundColor(progress(rawValue: item.status)?.color)
                        .cornerRadius(30)
                        .overlay {
                            Text("\(progress(rawValue: item.status)?.text)")
                        }
                        .padding(.leading,13)
                        Spacer()
                    }
                    
                }
                    
                    
                }
            .onAppear {
                content = item.feedbackMd
            }
        
            }
    }



enum progress : String, Codable{
    case wait = "wait"
    case success = "success"
    case ing = "ing"
    case failure = "failure"
    
    var text : String{
        switch self{
        
        case .wait:
            return "대기 중"
            
        case .success:
            return "분석 완료"
        case .ing:
            return "분석 중"
        case .failure:
            return "분석 실패"
        }
    }
    
    var color : Color{
        switch self {
        case .ing:
            return .tagSelected
        case .success:
            return .green
        case .wait:
            return .gray
        case .failure:
            return .red
        }
    }
}



