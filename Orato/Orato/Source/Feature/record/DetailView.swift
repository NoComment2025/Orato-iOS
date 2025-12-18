//
//  DetailView.swift
//  Orato
//
//  Created by maple on 9/16/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var content : RecordModel
    @Binding var alert : Bool
    var body: some View {
        ZStack{
            Color.black
            VStack{
                HStack{
                    Button{
                        dismiss()
                    }label: {
                        Text("뒤로가기")
                    }
                    Spacer()
                }
                .padding(.top,5)
                Text(content.topic)
                    .font(.bold(25))
                    .padding(.vertical,40)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.profilebox)
                    .frame(width: 340,height: 400)
                    .overlay {
                        VStack{
                            HStack{
                                Text(content.feedbackMd)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal,10)
                                    .padding(.vertical,10)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                Spacer()
                
            }
        }
        
        
            .onAppear(){print("yaho")}
            .onDisappear(){print("hing")}
            .navigationBarBackButtonHidden()
            
    }
        
}

