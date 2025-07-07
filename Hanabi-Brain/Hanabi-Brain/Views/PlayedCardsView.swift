//
//  PlayedCardsView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import SwiftUI

struct PlayedCardsView: View {
    
    @State var whiteCards = PlayedPile(color: .white)
    @State var redCards = PlayedPile(color: .red)
    @State var greenCards = PlayedPile(color: .green)
    @State var blueCards = PlayedPile(color: .blue)
    @State var yellowCards = PlayedPile(color: .yellow)
    
    var body: some View {
        VStack {
            Text("Overview")
            
            HStack {
                VStack(alignment: .center) {
                    Text("Played Cards")
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .border(.red)
                    CardView(card: whiteCards.top, emptyText: "Empty")
                    CardView(card: redCards.top, emptyText: "Empty")
                    CardView(card: greenCards.top, emptyText: "Empty")
                    CardView(card: blueCards.top, emptyText: "Empty")
                    CardView(card: yellowCards.top, emptyText: "Empty")
                }
                .border(.red)
                VStack {
                    Text("Discarded Cards")
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .border(.red)
                    CardView(card: whiteCards.top, emptyText: "Empty")
                    CardView(card: redCards.top, emptyText: "Empty")
                    CardView(card: greenCards.top, emptyText: "Empty")
                    CardView(card: blueCards.top, emptyText: "Empty")
                    CardView(card: yellowCards.top, emptyText: "Empty")
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview() {
    PlayedCardsView()
}
