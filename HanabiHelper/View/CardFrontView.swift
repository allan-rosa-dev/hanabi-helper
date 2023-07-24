//
//  CardFrontView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

struct CardFrontView: View {

    // MARK: - Attributes
//    @ObservedObject var card: GameCard
    var text: String
    var color: Color

    // MARK: - Init
    init(text: String, color: Color) {
        self.text = text
        self.color = color
//        if let card {
//            self.card = card
//        } else {
//            self.card = GameCard(color: .multicolor, number: .invalid(text: "?"))
//        }
    }

    // MARK: - Helper Functions

//    private func getColor() -> Color {
//        if case .invalid(_) = card.number {
//            return Color.pink
//        }
//        return card.color.color()
//    }
//
//    private func getNumber() -> String {
//        return card.number.description()
//    }

    // MARK: - View
    var body: some View {
        // MARK: - Card's graphical elements
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

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView(text: "?", color: .pink)
    }
}
