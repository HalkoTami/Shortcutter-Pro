//
//  Image.swift
//  ShortcutterPro
//
//  Created by Haruko Tamamushi on 2023/06/11.
//

import Foundation
import SwiftUI

extension Image {

    init(image: Images) {
            // Perform any necessary initialization here based on the custom parameter
        self.init(image.stringValue())
        }
    func tinted(with color: Color) -> some View {
            self
            .renderingMode(.original)
            .foregroundColor(color)
        }
}
