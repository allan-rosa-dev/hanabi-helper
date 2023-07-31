//
//  CardSelectorView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 29/07/23.
//

import SwiftUI

struct CardSelectorView: View {
    // MARK: - Attributes
    @State var handSize: Int
    
    // MARK: - Init
    init(handSize: Int) {
        self.handSize = handSize
    }

    // MARK: - Design
    var body: some View {
        HStack {
            let cardIndicators = 0..<handSize
            ForEach(cardIndicators, id: \.self) { _ in
                Checkbox()
                    .background()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

// MARK: - Preview
struct CardSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardSelectorView(handSize: 5)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("2P / 3P")
            CardSelectorView(handSize: 4)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("4P / 5P")
        }
    }
}
