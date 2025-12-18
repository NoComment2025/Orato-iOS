//
//  TabView.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

enum TabViewType : CaseIterable{
    
    case record
    case analyze
    case profile
    
    var image : String{
        switch self{
        case .analyze:
            return "analyze_tab"
        case .record:
            return "record_tab"
        case .profile:
            return "profile_tab"
        }
    }
    
    var text : String{
        switch self{
        case .analyze:
            return "분석"
        case .record:
            return "기록"
        case .profile:
            return "프로필"
        }
    }
}
