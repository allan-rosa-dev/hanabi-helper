//
//  ContentView.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

struct ContentView: View {
    let gameConfig = GameConfig(mode: .regular, numberOfPlayers: .two)
    @State var cardGuesses: [CardGuess] = [
        CardGuess(),
        CardGuess(),
        CardGuess(),
        CardGuess(),
    ]
    @State var hint: Hint = Hint(category: .color, logic: .have, colorValue: .white, numberValue: .one)
    
    var body: some View {
        VStack {
            HStack() {
                ForEach(cardGuesses) { cardGuess in
                    CardGuessView(cardGuess: cardGuess)
                }
            }
            HintPickerView(hint: $hint)
            Button("Give Hint") {
                cardGuesses.filter { $0.isSelected }.forEach { cardGuess in
                    cardGuess.applyHint(hint)
                }
                for (index, cardGuess) in cardGuesses.enumerated() {
                    print("CardGuess #\(index): [\(cardGuess.description)]")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
