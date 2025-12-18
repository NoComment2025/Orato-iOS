//
//  TagButton.swift
//  Orato
//
//  Created by maple on 9/10/25.
//

import SwiftUI

struct TagButton: View {
    @State var tex : String = ""
    var body: some View {
        TextField("입력",text: $tex)
            .textFieldStyle(.roundedBorder)
            .overlay {
                HStack{
                    Spacer()
                    Image(systemName: "circle")
                }
            }
            .frame(width: 140)
            
    }
}

#Preview {
    TagButton()
}
