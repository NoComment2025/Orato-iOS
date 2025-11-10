//
//  RecordListItem.swift
//  Orato
//
//  Created by maple on 9/16/25.
//

import SwiftUI

struct RecordListItem: View {
    var topic : String = "주제"
    var date : Int = 1
    var tag : Tag = .presentation
    var progress : progress = .ing
    @Binding var content : String
    @State var ischecked : Bool = false
    @State var sheet : Bool = false
    @State var alert : Bool = false
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
                            if progress == .success{sheet.toggle()}
                            else{alert.toggle()}
                        }label: {
                            Text(topic)
                                .foregroundStyle(.white)
                        }
                        .alert("열람불가1", isPresented: $alert, actions: {
                            Text("열람 불가")
                        })
                        .sheet(isPresented: $sheet){
                            DetailView(content: $content)
                                
                        }
                        
                        Text("\(date)")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    HStack{
                        Rectangle()
                        .frame(width: 70,height: 36)
                        .background(Color.tagSelected)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .overlay {
                            Text("\(tag.text)")
                        }
                        .padding(.horizontal,15)
                        Rectangle()
                        .frame(width: 70,height: 36)
                        .background(Color.tagSelected)
                        .foregroundColor(progress.color)
                        .cornerRadius(30)
                        .overlay {
                            Text("\(progress.text)")
                        }
                        .padding(.leading,13)
                        Spacer()
                    }
                    
                }
                    
                    
                }
        
            }
    }



enum progress : String{
    case wait
    case success
    case ing
    case failure
    
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



