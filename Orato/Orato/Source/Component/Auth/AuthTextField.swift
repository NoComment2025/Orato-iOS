//
//  AuthTextField.swift
//  Orato
//
//  Created by maple on 9/30/25.
//

import SwiftUI

struct AuthTextField: View {
    @State var showing = ""
    @Binding var input : String
    var body: some View {
        Rectangle()
            .overlay {
                TextField(showing, text: $input,prompt: Text(showing).foregroundStyle(.authFieldText))
                    .foregroundColor(.white)
                    .padding(.leading,38)
            }
            .frame(width: 300,height: 50)
            .cornerRadius(20)
            .foregroundColor(.authField)
        
    }
}
