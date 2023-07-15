//
//  StartScreenState.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/07/15.
//

import Foundation
import SwiftUI

struct StartScreenState {
    let levelState:LevelState
    
    static let initialState = StartScreenState(levelState: LevelState(currentXp: 0))
}

struct LevelState {
    let currentXp:Int
    var level :Level {
        return Level.getLevelByCurrentXp(currentXp: currentXp)
    }
}

enum Level: CaseIterable {
    case level1
    case level2
    case level3
    case level4
    case level5
    
    var maxXp: Int {
        switch self {
        case .level1:
            return 1000
        case .level2:
            return 5000
        case .level3:
            return 30000
        case .level4:
            return 100000
        case .level5:
            return 300000
        }
    }
    
    var color: Color {
        switch self {
        case .level1:
            return Color.levelBarBlue
        case .level2:
            return Color.levelBarYellow
        case .level3:
            return Color.levelBarGreen
        case .level4:
            return Color.levelBarPurple
        case .level5:
            return Color.levelBarRed
        }
    }
    
    var badgeText:String {
        return Level.allCases.firstIndex(of: self)?.formatted() ?? ""
    }
    
    static func getLevelByCurrentXp(currentXp:Int)->Level{
        for level in Level.allCases {
            let isFirstItem = Level.allCases[0] == level
            let levelBefore = Level.allCases[(Level.allCases.firstIndex(of: level) ?? 1)-1]
            if(
                (isFirstItem && currentXp<level.maxXp)||(currentXp >= levelBefore.maxXp && currentXp < level.maxXp)
            ){
                return level
            }
        }
        return level5   
    }
}
