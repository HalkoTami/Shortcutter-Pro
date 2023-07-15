//
//  ContentView.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/03.
//

import SwiftUI
import AppKit
import Cocoa
struct AppStartScreen: View {
    @ObservedObject var viewModel:StartViewModel
    var body: some View {
        StartScreen(state: viewModel.state)
    }
}


private struct StartScreen: View {
    let state:StartScreenState
    var body: some View {
        VStack {
            HStack {
                ButtonShortcutsManager()
                Spacer()
            }
            Spacer()
            ZStack{
                LevelBar(state: state.levelState)
            }
            Spacer()
                .frame(height: 70)
            HStack {
                StartButton(playMode: .Practice)
                Spacer()
                    .frame(width: 100)
                StartButton(playMode: .Test)
            }
            Spacer()
        }
        .padding(.all,30)
        .background(Color.windowBackground)
        .navigationTitle("Start")
        .toolbarBackground(Color.titlebarBackground)
        .frame(
            minWidth: 950,
            maxWidth: .infinity,
            minHeight: 560,
            maxHeight: .infinity
        )
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(state :StartScreenState.initialState)
    }
}
