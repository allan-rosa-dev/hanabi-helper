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
//        CardGuess(),
    ]
    @State var hint: Hint = Hint(category: .color, logic: .have, colorValue: .white, numberValue: .one)
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack() {
                    ForEach(cardGuesses) { cardGuess in
                        CardGuessView(cardGuess: cardGuess)
                            .containerRelativeFrame([.horizontal])
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(25, for: .scrollContent)
            
            HStack() {
                ForEach(cardGuesses) { cardGuess in
                    CardSelectView(cardGuess: cardGuess)
                }
            }
            .padding(10)
            
            HintPickerView(hint: $hint)
            
            Button("Give Hint 💡") {
                cardGuesses.filter { $0.isSelected }.forEach { cardGuess in
                    cardGuess.applyHint(hint)
                }
//                for (index, cardGuess) in cardGuesses.enumerated() {
//                    print("CardGuess #\(index): [\(cardGuess.description)]")
//                }
            }
            .font(.system(size: 30))
            .bold()
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundStyle(.white)
            .background(in: .capsule)
            .backgroundStyle(.indigo)
        }
        .padding(5)
    }
}

#Preview {
    ContentView()
}
