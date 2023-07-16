//
//  ButtonPractice.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

enum PlayMode {
    case Practice
    case Test
    
    func timeLimit() -> Int{
        switch self {
            case .Practice:
                return 300
            case .Test:
                return 180
        }
    }
    
    func KeyVisible() -> Bool {
        switch self {
        case .Practice:
            return true
        case .Test:
            return false
        }
    }
    
    func getEyeImage()->Images {
        if(self.KeyVisible()) {
            return Images.icEyeOpen
        } else {
            return Images.icEyeClosed
        }
    }
    
}

struct StartButton : View {
    let playMode:PlayMode
    let onButtonClick:()->()
    let width:CGFloat = 190
    let height:CGFloat = 250
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray1,lineWidth: 2)
                Text(verbatim: .startButtonTitle(playMode: playMode))
                    .font(Font.buttonStartTitle)
            }
            .frame(height: 68)
            .padding(2)
            .onTapGesture {
                onButtonClick()
            }
            Spacer()
                .frame(height: 10)
            DetailLayout(
                leftView: AnyView(
                    Image(image: .icTimer)
                        .resizable()
                ),
                rightView: AnyView(
                    Text(playMode.timeLimit().formatSecondsToString())
                        .font(Font.buttonStartTimelimit)
                )
            )
            Spacer()
                .frame(height: 10)
            DetailLayout(
                leftView: AnyView(
                    Image(image: .icKeycapSingle)
                        .resizable()
                ),
                rightView: AnyView(
                    Image(
                        image: playMode.getEyeImage()
                    )
                )
            )
            if(playMode == .Test){
                DetailLayout(
                    leftView: AnyView(
                        Text("XP")
                            .font(.buttonStartXp)
                    ),
                    rightView: AnyView(
                        Text("x3!")
                            .font(.buttonStartXpDetail)
                            .foregroundColor(.basicYellow)
                    )
                )
            }
            Spacer()
        }
        .frame(width: width, height: height)
    }
}

private struct DetailLayout : View {
    var height:CGFloat = 45
    let leftView:AnyView
    let rightView:AnyView
    var body: some View {
        GeometryReader { geometry in
            let width:CGFloat = geometry.size.width
            HStack{
                leftView
                    .frame(width: height)
                    .padding(.trailing,width/15)
                rightView
                    .frame(width: width/3)
            }
            .padding(.trailing,width/5)
            .frame(
                width: width,height: height
            )
        }
        .frame(height: height)
        
    }
}

struct StartButtonPreview: PreviewProvider {
    static var previews: some View {
        StartButton(
            playMode: .Practice,
            onButtonClick: { }
        )
    }
}
