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
            .frame(width: .infinity, height: 70)
            .padding(2)
            Spacer()
                .frame(height: height/12)
            TimeLimit(width: width)
            
        }
        .frame(width: width, height: height)
    }
}

private struct TimeLimit : View {
    var width:CGFloat = 227
    var timeLimitText = "05:00"
    var body: some View {
        HStack {
            Image(image: Images.icTimer)
                .padding(.trailing,width/15)
            Text(timeLimitText)
                .font(Font.buttonStartTimelimit)
        }
        .padding(.trailing,width/5)
        .frame(width: .infinity)
        
    }
}



struct ButtonPracticePreview: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}
