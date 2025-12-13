//
//  Font+.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

extension Font {
    static func customBold(ofSize size: CGFloat) -> Font {
        return .custom(FontName.bold.rawValue, size: size)
    }
    
    static func customBlack(ofSize size: CGFloat) -> Font {
        return .custom(FontName.black.rawValue, size: size)
    }
    
    static func customExtraBold(ofSize size: CGFloat) -> Font {
        return .custom(FontName.extraBold.rawValue, size: size)
    }
    
    static func customExtraLight(ofSize size: CGFloat) -> Font {
        return .custom(FontName.extraLight.rawValue, size: size)
    }
    
    static func customLight(ofSize size: CGFloat) -> Font {
        return .custom(FontName.light.rawValue, size: size)
    }
    
    static func customMedium(ofSize size: CGFloat) -> Font {
        return .custom(FontName.medium.rawValue, size: size)
    }
    
    static func customRegular(ofSize size: CGFloat) -> Font {
        return .custom(FontName.regular.rawValue, size: size)
    }
    
    static func customSemiBold(ofSize size: CGFloat) -> Font {
        return .custom(FontName.semiBold.rawValue, size: size)
    }
    
    static func customThin(ofSize size: CGFloat) -> Font {
        return .custom(FontName.thin.rawValue, size: size)
    }
}
