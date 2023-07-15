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
    
    var maxXp: String {
        let index = Level.allCases.firstIndex(of: self)
        let MaxLevel = index == Level.allCases.count
        if(MaxLevel) {
            return "♾️"
        } else {
            return "\(Level.allCases[index! + 1].levelRange.min()!)"
        }
    }
    
    var levelRange: ClosedRange<Int> {
        switch self {
        case .level1:
            return 0...999
        case .level2:
            return 1000...4999
        case .level3:
            return 5000...29999
        case .level4:
            return 30000...299999
        case .level5:
            return 300000...Int.max
        }
    }
    
    static func getProgress(currentXp:Int)->Float{
        let level = Level.getLevelByCurrentXp(currentXp: currentXp)
        let xpInCurrentLevel:Float = Float(currentXp - (level.levelRange.lowerBound))
        let percentage:Float = xpInCurrentLevel/Float(level.levelRange.count)
        return round(percentage*10)/10
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
            if(level.levelRange.contains(currentXp)) {
                return level
            }
        }
        return level5   
    }
}
