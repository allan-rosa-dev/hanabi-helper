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
    @State var isBlank = false

    @State private var flip = false

    // MARK: - Init
    init(card: GameCard? = nil) {
        if let card {
            self.card = card
        } else {
            self.card = GameCard(color: .white, number: .five)
        }
    }

    // MARK: - Helper Functions

    func getColor() -> Color {
        guard !isBlank else {
            return Color.mint
        }
        return card.color.color()
    }

    func getNumber() -> String {
        guard !isBlank else {
            return "?"
        }
        return card.number.description()
    }

    // MARK: - View
    var body: some View {
        // MARK: - Card's graphical elements
        ZStack {
            K.backgroundColor
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .fill(getColor())
                .frame(width: .infinity, height: .infinity)
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
