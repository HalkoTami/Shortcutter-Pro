//
//  LevelBar.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

struct LevelBar : View {
    let state:LevelState
    let width :CGFloat = 270
    let height: CGFloat = 50
    
    var body: some View {
        ZStack() {
            GeometryReader { geometry in
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray1)
                Rectangle()
                    .fill(state.level.color)
                    .frame(width: geometry.size.width * CGFloat(Level.getProgress(currentXp: state.currentXp)),height: geometry.size.height)
                
                StrokeText(
                    text: "\(state.currentXp)/" + state.level.maxXp,
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
                Badge(color: state.level.color)
                    .frame(width: height, height: height)
                Spacer()
            }
        }
        .frame(width: width, height: height)
    }
}

private struct Badge :View {
    let color:Color
    var body: some View {
        ZStack(alignment: .center){
            GeometryReader{ geometry in
                Image(image: Images.badgeBackground)
                    .resizable()
                    .tinted(with: color)
                Image(image: Images.badgeForeground)
                    .resizable()
            }
            Text("1")
                .font(Font.levelBadge) 
        }
    }
}

struct LevelBarPreview: PreviewProvider {
    static var previews: some View {
        LevelBar(state: LevelState(currentXp: 400   ))
    }
}
struct BadgePreview: PreviewProvider {
    static var previews: some View {
        Badge(color: Level.level5.color)
    }
}
