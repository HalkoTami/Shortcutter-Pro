//
//  ButtonManageShortcuts.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct ButtonShortcutsManager: View {
    var onClick:()->() = { }
    @State var buttonState :ButtonState = .Default
    @State var isClicked = false
    let buttonMinSize:CGFloat = 70
    let buttonMaxSize:CGFloat = 200
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray1, lineWidth: 1)
                    .padding(1)
                    .frame(width: self.buttonSize)
                    .animation(.easeInOut(duration: 0.1),value: buttonSize)
                HStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray1, lineWidth: 2)
                            .padding(5)
                        
                        Image(Images.icKeycap.stringValue())
                            .resizable()
                            .renderingMode(.original)
                            .interpolation(.none)
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: buttonMinSize-25,
                                height: buttonMinSize-25
                            )
                    }
                    .frame(
                        width: buttonMinSize,
                        height: buttonMinSize
                    )
                    if buttonState == .Hover {
                        Text(verbatim: "ショートカット\nを編集")
                            .font(.hoverChangeButton)
                            .multilineTextAlignment(.center)
                            .scaledToFill()
                        Spacer()
                    }
                }
            }
            if !(buttonState == .Hover) {
                Spacer()
            }
        }
        .frame(
            width: buttonMaxSize,
            height: buttonMinSize
        )
        .onHover { hovering in
            self.buttonState = hovering ? .Hover : .Default
        }
        .opacity(self.isClicked ? 0.5 : 1)
        .onTapGesture {
            self.isClicked = true
            onClick()
        }
    }
    var buttonSize: CGFloat {
        return self.buttonState == .Hover ? buttonMaxSize : buttonMinSize
    }
}

struct ButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack{
            ButtonShortcutsManager(buttonState:.Hover)
            ButtonShortcutsManager(buttonState:.Default)
            ButtonShortcutsManager(buttonState: .Default, isClicked: true)
        }
        .frame(width: 400)
    }
}

enum ButtonState{
    case Default
    case Hover
}
