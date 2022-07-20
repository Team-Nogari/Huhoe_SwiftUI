//
//  Font+extension.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/20.
//

import SwiftUI

extension Font {
    static func withKOHIBaeum(dynamicFont: CustomDynamicFont) -> Font {
      return .custom("KOHIBaeum", size: dynamicFont.size)
    }
}

enum CustomDynamicFont {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2

    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 18
        case .body:
            return 17
        case .callout:
            return 16
        case .subhead:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        }
    }
}
