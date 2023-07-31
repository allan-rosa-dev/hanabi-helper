//
//  CardPossibilityView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 25/07/23.
//

import SwiftUI

struct CardPossibilityView: View {

    // MARK: - Attributes
    @State var mark: Possibility
    @State var color: Color

    // MARK: - Init
    init(_ mark: Possibility = .unknown, color: Color = .gray) {
        self.mark = mark
        self.color = color
    }

    // MARK: - Design
    private enum Layout {
        static let cornerRadius: CGFloat = 20.0
    }

    var body: some View {
        ZStack {
            color
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    RoundedRectangle(cornerRadius: Layout.cornerRadius)
                        .stroke(.black, lineWidth: 4)
                )
                .cornerRadius(Layout.cornerRadius)

            Text(mark.description)
        }
    }
}

// MARK: - Preview
struct CardPossibilityView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardPossibilityView()
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Unknown")

            CardPossibilityView(.correct)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Correct")

            CardPossibilityView(.incorrect)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Incorrect")
        }
    }
}
