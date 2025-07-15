//
//  PlayedCardsView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import SwiftUI

struct PlayedCardsView: View {
    @State var whiteTracker: CardTracker = CardTracker(color: .white, playedCards: [])
    
    @State var redTracker: CardTracker = CardTracker(color: .red)
    
    @State var greenTracker: CardTracker = CardTracker(
        color: .green,
        playedCards: [
            Card(color: .green, number: .one),
            Card(color: .green, number: .two),
            Card(color: .green, number: .three),
                     ],
        discardedCards: [
            Card(color: .green, number: .one),
            Card(color: .green, number: .one),
            Card(color: .green, number: .five),
            Card(color: .green, number: .four),
            Card(color: .green, number: .four)
        ]
    )
    
    @State var blueTracker: CardTracker = CardTracker(color: .blue)
    
    @State var yellowTracker: CardTracker = CardTracker(color: .yellow)
    
    
    var body: some View {
        Grid(verticalSpacing: 10) {
            ForEach(CardNumber.allCases) { number in
                GridRow() {
                    Text(number.description)
                        .font(.system(size: 40))
                    
                    Grid(verticalSpacing: 5) {
                        ForEach(1...number.totalCount, id: \.self) { iteration in
                            GridRow() {
                                ForEach(CardColor.allCases) { color in
                                    Circle()
                                        .stroke(.black, lineWidth: 2)
                                        .fill(color.value)
                                        .frame(width: 20, height: 20)
                                        .opacity(getTracker(of: color).count(of: number) < iteration ? 1 : 0.2)
                                }
                            }
                        }
                    }

                }
            }
        }
    }
    
    private func getTracker(of color: CardColor) -> CardTracker {
        switch color {
        case .red: redTracker
        case .white: whiteTracker
        case .blue: blueTracker
        case .yellow: yellowTracker
        case .green: greenTracker
        }
    }
}

#Preview() {
    PlayedCardsView()
}
