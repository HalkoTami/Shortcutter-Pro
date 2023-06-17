//
//  LevelBar.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct LevelBar : View {
    let width :CGFloat = 270
    let height: CGFloat = 50
    
    var body: some View {
        ZStack() {
            GeometryReader { geometry in
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray1)
                Rectangle()
                    .fill(Color.basicBlue)
                    .frame(width: geometry.size.width * 0.1,height: geometry.size.height)
                
                StrokeText(
                    text: "265/2000",
                    strokeSize: 1,
                    color: Color.gray1
                )
                    .foregroundColor(Color.gray2)
                    .font(Font.levelBar)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height / 2)
            }
            .padding(.vertical,height*0.18)
            .padding(.leading,height*0.80)
    
            HStack{
                Badge()
                    .frame(width: height, height: height)
                Spacer()
            }
        }
        .frame(width: width, height: height)
    }
}

private struct Badge :View {
    var body: some View {
        ZStack(alignment: .center){
            GeometryReader{ geometry in
                Image(image: Images.badgeBackground)
                    .resizable()
                    .tinted(with: Color.basicBlue)
                Image(image: Images.badgeForeground)
                    .resizable()
            }
            Text("1")
                .font(Font.levelBadge) 
        }
        .frame(width: .infinity, height: .infinity)
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
