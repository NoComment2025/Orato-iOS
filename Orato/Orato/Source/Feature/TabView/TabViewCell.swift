//
//  TabViewCell.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

enum TabViewCell : CaseIterable{
    case Analyze
    case History
    case profile
    
    var image : String{
        switch self{
        case .Analyze:
            return "chart.pie.fill"
        case .History:
            return "book.fill"
        case.profile:
            return "person.circle"
        }
    }
    var text : String{
        switch self{
        case .Analyze:
            return "분석"
        case .History:
            return "기록"
        case.profile:
            return "프로필"
        }
    }
    
}
