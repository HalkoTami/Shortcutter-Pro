//
//  Image.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

enum Images {
    case badgeForeground
    case badgeBackground
    case icKeycap
    case icKeycapSingle
    case icTimer
    
    func stringValue() -> String {
            switch self {
            case .badgeForeground:
                return "ic_level_badge_foreground"
            case .badgeBackground:
                return "ic_level_badge_background"
            case .icKeycap:
                return "ic_keycap"
            case .icKeycapSingle:
                return "ic_keycap_single"
            case .icTimer:
                return "ic_timer"
            }
        }
}

