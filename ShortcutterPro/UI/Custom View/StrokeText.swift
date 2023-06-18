//
//  StrokeText.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct StrokeText: View {
    let text: String
    let strokeSize: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  strokeSize, y:  strokeSize)
                Text(text).offset(x: -strokeSize, y: -strokeSize)
                Text(text).offset(x: -strokeSize, y:  strokeSize)
                Text(text).offset(x:  strokeSize, y: -strokeSize)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
