//
//  ButtonPractice.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI


struct StartButton : View {
    var width:CGFloat = 227
    var height:CGFloat = 263
    var text = "PRACTICE"
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray1,lineWidth: 2)
                Text(text)
                    .font(Font.buttonStartTitle)
            }
            .frame(height: height/4)
            .padding(2)
            Spacer()
                .frame(height: height/12)
            TimeLimit()
            Spacer()
                .frame(height: height/12)
            KeyVisibility()
        }
        .frame(width: width, height: height)
    }
}

private struct TimeLimit : View {
    var timeLimitText = "05:00"
    var body: some View {
        DetailLayout(
            leftView: Image(image: .icTimer),
            rightView: AnyView(
                Text(timeLimitText)
                    .font(Font.buttonStartTimelimit)
            )
        )
    }
}
private struct KeyVisibility : View {
    var body: some View {
        DetailLayout(
            leftView: Image(image: .icKeycapSingle),
            rightView: AnyView(
                Image(image: .icEyeOpen)
            )
        )
        
    }
}
private struct DetailLayout : View {
    var height:CGFloat = 45
    let leftView:Image
    let rightView:AnyView
    var body: some View {
        GeometryReader { geometry in
            let width:CGFloat = geometry.size.width
            HStack{
                leftView
                    .resizable()
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


struct ButtonPracticePreview: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}
