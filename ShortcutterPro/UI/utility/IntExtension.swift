//
//  Utility.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/17.
//

import Foundation

extension Int {
    func formatSecondsToString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
