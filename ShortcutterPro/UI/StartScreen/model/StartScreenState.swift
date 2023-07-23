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
        return LevelState.getLevelByCurrentXp(currentXp: currentXp)
    }
    var progress:CGFloat {
        return CGFloat(LevelState.getProgress(currentXp: currentXp))
    }
    
    var maxXp: Int {
        return level.levelRange.upperBound+1
    }
    
    var isMax:Bool {
        let index = Level.allCases.firstIndex(of: level)
        let MaxLevel = index == Level.allCases.count-1
        return MaxLevel
    }
    
    var badgeText:String {
        if(isLevelInfinity) {
            return "?!"
        } else {
            return String(level.levelCount)
        }
    }
    
    var isLevelInfinity:Bool {
        return level.isMax && currentXp>level.levelRange.upperBound
    }
    
    static func getProgress(currentXp:Int)->Float{
        let level = LevelState.getLevelByCurrentXp(currentXp: currentXp)
        let xpInCurrentLevel:Float = Float(currentXp - (level.levelRange.lowerBound))
        let percentage:Float = xpInCurrentLevel/Float(level.levelRange.count)
        if(level.isMax && currentXp>level.levelRange.upperBound) {
            return 1.0
        }
        return round(percentage*100)/100
    }
    
    static func getLevelByCurrentXp(currentXp:Int)->Level{
        for level in Level.allCases {
            if(level.levelRange.contains(currentXp)) {
                return level
            }
        }
        return Level.level5
    }
}

enum Level: CaseIterable {
    case level1
    case level2
    case level3
    case level4
    case level5
    
    var isMax:Bool {
        let index = Level.allCases.firstIndex(of: self)
        let MaxLevel = index == Level.allCases.count-1
        return MaxLevel
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
            return 300000...9999999
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
    
    var levelCount : Int{
        Level.allCases.firstIndex(of: self)! + 1
    }
}
