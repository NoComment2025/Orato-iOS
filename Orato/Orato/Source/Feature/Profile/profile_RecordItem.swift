//
//  profile_RecordItem.swift
//  Orato
//
//  Created by maple on 9/17/25.
//

import SwiftUI

struct profile_RecordItem: View {
    var title : String = "1"
    var tag : Tag = .etc
    let time : Date = Date()
    var body: some View {
        Rectangle()
            .overlay{
                HStack{
                    Text(title)
                        .foregroundStyle(.white)
                        .padding(.leading,19)
//                    Rectangle()
//                        .frame(width: 70,height: 36)
//                        .foregroundStyle(.tagSelected)
//                        .foregroundColor(.white)
//                        .cornerRadius(30)
//                        .overlay {
//                            Text("\(tag.text)")
//                                .foregroundStyle(.white)
//                        }
//                        .padding(.trailing,19)
                    Text(tag.text)
                        .foregroundStyle(.white)
                        .padding(.horizontal,30)
                  
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 280,height: 65)
            .foregroundStyle(.black)
            .cornerRadius(20)
    }
}

#Preview {
    profile_RecordItem()
}
