//
//  AnalyzeViewModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

class AnalyzeViewModel : ObservableObject{
    @Published var info : AnalyzeModel = AnalyzeModel(topic: "", tag: .all, hasTimeLimit: false, currentTime: Date())
    
    func yaho() async {
        do {
            let result = try await NetworkRunner.share.request("/analyze/sound", method: .post, parameters: info,response: Bool.self)
            
        } catch {
            
        }
        
        
    }
}
