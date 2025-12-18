//
//  AnalyzeModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct AnalyzeModel: Codable{
//    var id = UUID()
    var topic : String = ""
    var tag : Tag = .all
    var hasTimeLimit : Bool = false
    var analyzeTime : Int?
    var currentTime : Date
}

