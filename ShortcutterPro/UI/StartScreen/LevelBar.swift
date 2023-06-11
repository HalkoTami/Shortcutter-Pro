//
//  LevelBar.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct LevelBar : View {
    var body: some View {
        ZStack() {
            GeometryReader { geometry in
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray1)
                //TODO: make corner only right topand bottom round
                Rectangle()
                    .fill(Color.basicBlue)
                    .frame(width: geometry.size.width * 0.8,height: 30)
                
                StrokeText(
                    text: "265/2000",
                    strokeSize: 1,
                    color: Color.gray1
                )
                    .foregroundColor(Color.gray2)
                    .font(Font.levelBar)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .frame(width: 230,height: 30)
        }
        .frame(width: 260, height: 70)
        .background(Color.basicYellow)
        
    }
}

private struct Badge :View {
    var body: some View {
        ZStack(alignment: .center){
            Image(image: Images.badgeBackground)
                .tinted(with: Color.basicBlue)
            Image(image: Images.badgeForeground)
            Text("1")
                .font(.system(size: 14, weight: .medium, design: .rounded))
        }
    }
}

struct LevelBarPreview: PreviewProvider {
    static var previews: some View {
        LevelBar()
    }
}
struct BadgePreview: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
