//
//  CardFrontView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

struct CardFrontView: View {

    // MARK: - Attributes
    var text: String
    var color: Color

    // MARK: - Init
    init(text: String, color: Color) {
        self.text = text
        self.color = color
    }

    // MARK: - Design
    var body: some View {
        ZStack {
            K.backgroundColor
                .opacity(0.0)
            RoundedRectangle(cornerRadius: 20)
                .fill(color)

            Text(text)
                .font(.largeTitle)
                .fontWeight(Font.Weight.black)
        }
    }
}

// MARK: - Preview
struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView(text: "?", color: .pink)
    }
}
