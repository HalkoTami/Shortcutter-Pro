//
//  String.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/17.
//

import Foundation

extension String {
    static let startButtonTitlePractice = "PRACTICE"
    static let startButtonTitleTest = "TEST"
    
    static func startButtonTitle(playMode:PlayMode)->String {
        switch playMode {
        case .Practice: return startButtonTitlePractice
        case .Test: return startButtonTitleTest
        }
    }
}
