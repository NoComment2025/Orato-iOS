//
//  DetailView.swift
//  Orato
//
//  Created by maple on 9/16/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var content : String
    var body: some View {
        Text(content)
        
            .onAppear(){print("yaho")}
            .onDisappear(){print("hing")}
                
            
    }
}

