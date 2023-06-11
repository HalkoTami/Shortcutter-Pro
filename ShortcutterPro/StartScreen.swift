//
//  ContentView.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/03.
//

import SwiftUI
import AppKit

struct StartScreen: View {
    var body: some View {
        VStack {
            HStack {
                SmallButton(
                    imageName: "ic_keycap"
                )
                Spacer()
            }
            Spacer()
            ZStack{
                LevelBar()
            }
            .padding(.bottom,40)
            HStack {
                ButtonPractice()
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
private struct LevelBar : View {
    var body: some View {
        ZStack {
            
        }
        .frame(width: 260, height: 70)
        .background(Color.basicYellow)
    }
}

private struct ButtonPractice : View {
    var body: some View {
        ZStack {
            
        }
        .frame(width: 227, height: 263)
        .background(Color.basicYellow)
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


private struct SmallButton: View {
    let imageName: String
    let buttonSize:CGFloat = 70
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray1, lineWidth: 1)
                .padding(1)
            Circle()
                .stroke(Color.gray1, lineWidth: 2)
                .padding(5)
            
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .interpolation(.none)
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: buttonSize-25,
                    height: buttonSize-25
                )
        }
        .frame(
            width: buttonSize,
            height: buttonSize
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
struct Button_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(
            imageName: "ic_keycap"
        )
    }
}
