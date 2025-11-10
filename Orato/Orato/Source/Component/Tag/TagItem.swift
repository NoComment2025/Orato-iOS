//
//  TagButton.swift
//  Orato
//
//  Created by maple on 9/10/25.
//

import SwiftUI

struct TagItem: View {
    @Binding var selected : Tag
    @State var allhidden : Bool
    var body: some View {
        HStack{
            ForEach(Tag.allCases,id: \.self){item in
                if allhidden{
                    if item != .all{
                        Button("\(item.text)"){
                            selected = item
                        }
                        .frame(width: 70,height: 36)
                        .background(selected != item ? .nonSelected : .tagSelected)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                    }
                }else{
                    Button("\(item.text)"){
                        selected = item
                    }
                    .frame(width: 70,height: 36)
                    .background(selected != item ? .nonSelected : .tagSelected)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
            }
            .frame(width: 85)
        }
    }
}
// 프로필 수정 페이지 만들기 / 프로필 수정 뷰모델에서 post 만들기 / 프로필 블록 색깔 정하기
