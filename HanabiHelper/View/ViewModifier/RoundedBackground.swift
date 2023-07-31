//
//  RoundedBackground.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 28/07/23.
//

import SwiftUI

struct RoundedBackground: ViewModifier {
    // MARK: - Attributes
    let color: Color

    // MARK: - Init
    init(_ color: Color = K.componentBackgroundColor) {
        self.color = color
    }

    // MARK: - Design
    func body(content: Content) -> some View {
        content
            .background(
                color
            )
            .cornerRadius(20)
    }
}
