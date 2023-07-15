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
    @State private var show = false
    private let repository = Repository()
    var body: some Scene {
        WindowGroup {
            VStack{
                if !show {
//                    let viewModel = StartViewModel(repository: repository)
//
//                    AppStartScreen(viewModel: viewModel)
                    RootView(show: $show)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color.blue)
                                        .transition(AnyTransition.move(edge: .leading)).animation(.default, value: 20)
                }
                if show {
                    NextView(show: $show)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                        .transition(AnyTransition.move(edge: .trailing)).animation(.default, value: 20)
                }
                
            }
        }
        .windowToolbarStyle(UnifiedWindowToolbarStyle())
        
    
    }
}
