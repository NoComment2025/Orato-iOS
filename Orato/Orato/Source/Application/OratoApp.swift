//
//  OratoApp.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

@main
struct OratoApp: App {
    @AppStorage("access") private var accesstoken : String?
    var body: some Scene {
        WindowGroup {
            if accesstoken == nil {
                LoginView()
            }else{
                MainView()
                    .onAppear {
                        print("yaho")
                    }
            }
        }
        
    }
}
