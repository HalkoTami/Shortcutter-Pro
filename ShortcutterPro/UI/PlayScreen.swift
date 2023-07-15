//
//  PlayScreen.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/07/15.
//

import Foundation
import SwiftUI

struct NextView: View {
    @Binding var show: Bool
    var body: some View {
        VStack{
            Button("Back") { self.show = false }
            Text("This is the second view")
        }
    }
}

struct RootView: View {
    @Binding var show: Bool
    var body: some View {
        VStack{
            Button("Next") { self.show = true }
            Text("This is the first view")
        }
    }
}
