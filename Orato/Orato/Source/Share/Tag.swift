//
//  Tag.swift
//  Orato
//
//  Created by maple on 9/10/25.
//

import SwiftUI

enum Tag : String, CaseIterable, Codable{
    case all
    case presentation
    case speech
    case talk
    case etc
    
    var text : String{
        switch self{
        case .all:
            return "전체"
        case .presentation:
            return "발표"
        case .speech:
            return "연설"
        case .talk:
            return "강연"
        case .etc:
            return "기타"
        }
    }
    
    
    
}
