//
//  Search_Textfield.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI

struct Search_Textfield: View {
    @State var tex : String = ""
    var body: some View {
        TextField("입력",text: $tex)
            .textFieldStyle(.roundedBorder)
            .overlay {
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "circle")
                    }
                }
            }
            .frame(width: 140)
            
    }
}

#Preview {
    Search_Textfield()
}
