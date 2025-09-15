//
//  TagButton.swift
//  Orato
//
//  Created by maple on 9/10/25.
//

import SwiftUI

struct Tagarr: View {
    var body: some View {
        HStack{
            ForEach(Tag.allCases,id: \.self){item in
                Button("\(item)"){
                    
                }
                
            }
        }
    }
}
#Preview {
    TagButton()
}
