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
    
    @State private var percentage:CGFloat = 0
    
    
    var body: some View {
        ZStack() {
            ZStack{
                Rectangle()
                    .fill(Color.gray1)
                    .overlay{
                        Rectangle()
                            .fill(state.level.color)
                            .scaleEffect(x:state.progress,anchor: .leading)
                            .animation(.easeInOut, value: state.progress)
                    }
                    .clipShape(RoundedCorners(tl: 0,tr: 10,bl: 0,br: 10))
                StrokeText(
                    text: "\(state.currentXp.formatLevelXpToString())/" + state.maxXp.formatLevelXpToString(),
                    strokeSize: 1,
                    color: Color.gray1
                )
                    .foregroundColor(Color.gray2)
                    .font(Font.levelBar)
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
        LevelBar(state: LevelState(currentXp: 2004000))
    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let w = rect.size.width
            let h = rect.size.height

            // Make sure we do not exceed the size of the rectangle
            let tr = min(min(self.tr, h/2), w/2)
            let tl = min(min(self.tl, h/2), w/2)
            let bl = min(min(self.bl, h/2), w/2)
            let br = min(min(self.br, h/2), w/2)
            
            path.move(to: CGPoint(x: w / 2.0, y: 0))
            path.addLine(to: CGPoint(x: w - tr, y: 0))
            path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: w, y: h - br))
            path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: bl, y: h))
            path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: tl))
            path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            path.closeSubpath()
        }
    }
}
