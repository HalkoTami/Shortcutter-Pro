//
//  Repository.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/07/15.
//

import Foundation
class Repository {
    func getCurrentXP(completion: @escaping (Int?) -> Void) {
        delay(seconds: 3.0){
            completion(300)
        }
    }
}

func delay(seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
