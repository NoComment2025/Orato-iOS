import SwiftUI

//extension UIFont {
//    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
//        let familyName = "Pretendard"
//
//        var weightString: String
//        switch weight {
//        case .black:
//            weightString = "Black"
//        case .bold:
//            weightString = "Blod"
//        case .heavy:
//            weightString = "ExtraBold"
//        case .ultraLight:
//            weightString = "ExtraLight"
//        case .light:
//            weightString = "Light"
//        case .medium:
//            weightString = "Medium"
//        case .regular:
//            weightString = "Regular"
//        case .semibold:
//            weightString = "SemiBold"
//        case .thin:
//            weightString = "Thin"
//        default:
//            weightString = "Regular"
//        }
//
//        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
//    }
//}
//
//  FontExt.swift
//  MEMOA
//
//  Created by dgsw30 on 9/23/24.
//

import SwiftUI

enum PretendardWeight: String {
    case bold = "Pretendard-Bold"
    case semibold = "Pretendard-SemiBold"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case light = "Pretendard-Light"
}

extension Font {
    private static func pretendard(weight: PretendardWeight, size: CGFloat) -> Self {
        Font.custom(weight.rawValue, size: size)
    }
    
    static func bold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .bold, size: size)
    }
    
    static func semibold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .semibold, size: size)
    }
    
    static func regular(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .regular, size: size)
    }
    
    static func medium(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .medium, size: size)
    }
    
    static func light(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .light, size: size)
    }
}
