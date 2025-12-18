//
//  TextField.swift
//  Orato
//
//  Created by maple on 9/17/25.
//

import SwiftUI
struct CustomField: View {
    @Binding var input : String
    
    var txt : String = ""
    var body: some View {
        Rectangle()
            .overlay{
                HStack{
                    TextField(
                        txt,text: $input)
                        .padding(.leading  ,13)
//                        .foregroundStyle(.fieldtextcolor)
                        .foregroundStyle(.white)
//                    Button{
//                        
//                    }label: {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundStyle(.black)
//                            .padding(.trailing,15)
//                    }
                }
                
            }
            .frame(width: 356,height: 52)
            .cornerRadius(20)
            .foregroundStyle(.tcolor)
    }
}


