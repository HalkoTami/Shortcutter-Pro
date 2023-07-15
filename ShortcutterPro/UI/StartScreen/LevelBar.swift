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
                    .fill(Color.gray1)
                    .frame(width: geometry.size.width/2)
                let levelBarWidth = geometry.size.width * state.progress
                if(geometry.size.width-levelBarWidth<10){
                    Rectangle()
                        .fill(state.level.color)
                        .frame(width: levelBarWidth/2)
                } else {
                    Rectangle()
                        .fill(state.level.color)
                        .frame(width: levelBarWidth)
                }
                RoundedRectangle(cornerRadius: 10)
                    .fill(state.level.color)
                    .frame(width: levelBarWidth, height: geometry.size.height)
                StrokeText(
                    text: "\(state.currentXp.formatLevelXpToString())/" + state.maxXp.formatLevelXpToString(),
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
            .padding(.leading,height*0.89)
    
            HStack{
                ZStack(alignment: .center){
                    GeometryReader{ geometry in
                        Image(image: Images.badgeBackground)
                            .resizable()
                            .tinted(with: state.level.color)
                        Image(image: Images.badgeForeground)
                            .resizable()
                    }
                    Text(state.badgeText)
                        .font(Font.levelBadge)
                }
                    .frame(width: height, height: height)
                Spacer()
            }
        }
        .frame(width: width, height: height)
    }
}

struct LevelBarPreview: PreviewProvider {
    static var previews: some View {
        LevelBar(state: LevelState(currentXp: 20000))
    }
}
