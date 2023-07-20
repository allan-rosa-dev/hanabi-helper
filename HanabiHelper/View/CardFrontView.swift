//
//  CardFrontView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

struct CardFrontView: View {

    // MARK: - Attributes
    @ObservedObject var card: GameCard
    @State private var flip = false

    // MARK: - Init
    init(card: GameCard? = nil) {
        if let card {
            self.card = card
        } else {
            self.card = GameCard(color: .multicolor, number: .invalid(text: "?"))
        }
    }

    // MARK: - Helper Functions

    private func getColor() -> Color {
        if case .invalid(_) = card.number {
            return Color.pink
        }
        return card.color.color()
    }

    private func getNumber() -> String {
        return card.number.description()
    }

    // MARK: - View
    var body: some View {
        // MARK: - Card's graphical elements
        ZStack {
            Color.white
                .opacity(0.0)
            RoundedRectangle(cornerRadius: 20)
                .fill(getColor())
                .rotation3DEffect(.degrees(flip ? 0 : 180), axis: (x: 0, y: 1, z:0))
            Text(getNumber())
                .font(.largeTitle)
                .fontWeight(Font.Weight.black)
        }
    }
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView()
    }
}
