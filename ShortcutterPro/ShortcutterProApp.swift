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
    private let startViewModel = StartViewModel(repository: Repository())
    @State private var state:MainState = MainState.initialState
    var body: some Scene {
    
        WindowGroup {
            VStack{
                switch state.screen {
                case .Start:
                    AppStartScreen(
                        navigateToPlay:{ state.navigateTo(screen: .Play) },
                        viewModel: startViewModel
                    )
                    .transition(AnyTransition.move(edge: .leading))
                    .animation(.easeIn(duration: 10.0),value:state.screen == .Start)
                case .Play :
                     NextView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                }
            }
            .transition(AnyTransition.move(edge: .trailing))
            .animation(.easeInOut,value: state.screen == .Play)
        }
        .windowToolbarStyle(UnifiedWindowToolbarStyle())
        
    
    }
}

struct MainState{
    var screen:Screen
    static let initialState:MainState = MainState(screen: .Start)
    mutating func navigateTo(screen:Screen){
        self.screen = screen
    }
}

enum Screen {
    case Start
    case Play
}
