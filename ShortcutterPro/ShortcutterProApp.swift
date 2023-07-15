//
//  ShortcutterProApp.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/03.
//

import SwiftUI
import AppKit

@main
struct ShortcutterProApp: App {
    private let repository = Repository()
    var body: some Scene {
        WindowGroup {
            let viewModel = StartViewModel(repository: repository)
            
            AppStartScreen(viewModel: viewModel)
        }
        .windowToolbarStyle(UnifiedWindowToolbarStyle())
        
    
    }
}
