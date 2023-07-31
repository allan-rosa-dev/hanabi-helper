//
//  CardBackView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

/// Responsibilities:
/// Display the possibilities of what is this card
/// Ex: Suppose the card is a White 3 and you have the hint (IS 3) - the view should display x on everything but the 3 column
struct CardBackView: View {

    // MARK: - Attributes
    @ObservedObject var cardGuesser: CardGuesser

    private var colorCount: Int {
        var count: Int
        switch cardGuesser.gameMode {
        case .regular:
            count = CardColor.allCases.filter{ $0 != .multicolor }.count
        default:
            count = CardColor.allCases.count
        }
        return count
    }

    // MARK: - Init
    init(gameMode: GameMode = .regular) {
        self.cardGuesser = CardGuesser(gameMode: .regular)
    }

    // MARK: - Helper Functions
    private func onSingleTap(color: CardColor, number: CardNumber) {
        let card = GameCard(color: color, number: number)
        print("Tapped \(card.color) \(card.number)")
    }

    // MARK: - Design
    var body: some View {
        ZStack {
            K.backgroundColor
                .opacity(0.0)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
            VStack {
                Spacer()
                // Grid
                Grid {
                    // Number Labels
                    GridRow {
                        ForEach(0 ..< CardNumber.allCases.count, id: \.self) { numberValue in
                            Text(CardNumber.allCases[numberValue].description)
                                .font(.largeTitle)
                        }
                        .onTapGesture {
                            print("Current: ")
                            cardGuesser.calculatePossbilities().forEach { card in
                                print(card.description)
                            }
                            print("---")
                        }
                    }
                    // Color Views
                    ForEach(0 ..< colorCount, id: \.self) { colorIndex in
                        GridRow {
                            ForEach(0 ..< CardNumber.allCases.count, id: \.self) { numberIndex in
                                CardPossibilityView(.incorrect, color: CardColor.allCases[colorIndex].value)
                                    .onTapGesture(count: 3) {
                                        cardGuesser.applyHint(Hint.number(isNormal: true, number: CardNumber.allCases[numberIndex]))
                                    }
                                    .onLongPressGesture {
                                        cardGuesser.applyHint(Hint.color(isNormal: false, color: CardColor.allCases[colorIndex]))
                                    }
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

// MARK: - Preview
struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
    }
}
