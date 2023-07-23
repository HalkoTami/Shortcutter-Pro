//
//  StartViewModel.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/07/15.
//

import Foundation
// ViewModel
class StartViewModel: ObservableObject {
    @Published var state: StartScreenState
    private let repository: Repository
    
    
    init(repository:Repository) {
        self.state = StartScreenState.initialState
        self.repository = repository
        
        fetchCurrentXP()
    }
    
    func fetchCurrentXP() {
        repository.getCurrentXP { [weak self] currentXP in
            if let currentXP = currentXP {
                let updatedLevelState = LevelState(currentXp: currentXP)
                self?.state = StartScreenState(levelState: updatedLevelState)
            }
        }
    }
}
