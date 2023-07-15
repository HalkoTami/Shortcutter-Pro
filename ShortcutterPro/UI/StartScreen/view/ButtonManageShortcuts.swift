//
//  ButtonManageShortcuts.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct ButtonShortcutsManager: View {
    let buttonSize:CGFloat = 70
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray1, lineWidth: 1)
                .padding(1)
            Circle()
                .stroke(Color.gray1, lineWidth: 2)
                .padding(5)
            
            Image(Images.icKeycap.stringValue())
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

struct ButtonPreview: PreviewProvider {
    static var previews: some View {
        ButtonShortcutsManager()
    }
}
