//
//  ContentView.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/03.
//

import SwiftUI
import AppKit
import Cocoa

struct StartScreen: View {
    var body: some View {
        VStack {
            HStack {
                ButtonShortcutsManager(
                    imageName: "ic_keycap"
                )
                Spacer()
            }
            Spacer()
            ZStack{
                LevelBar(width: 300)
            }
            .padding(.bottom,40)
            HStack {
                StartButton()
                Spacer()
                    .frame(width: 40)
                ButtonTest()
            }
            Spacer()
        }
        .padding(.all,30)
        .frame(
            minWidth: 800, maxWidth: .infinity,
            minHeight:600, maxHeight: .infinity
        )
        .background(Color.windowBackground)
        .navigationTitle("Start")
        .toolbarBackground(Color.titlebarBackground)
    }
}

private struct ButtonTest : View {
    var body: some View {
        ZStack {
            
        }
        .frame(width: 227, height: 263)
        .background(Color.basicYellow)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
