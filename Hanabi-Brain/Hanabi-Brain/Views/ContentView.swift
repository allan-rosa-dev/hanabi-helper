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
    
    @State var playButtonIsActive = true
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    PlayedCardsView()
                } label: {
                    Text("Played Cards 🔎")
                }
                
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
                
                HStack {
                    Button("Give Hint 💡") {
                        selectedCardGuesses.forEach { cardGuess in
                            cardGuess.applyHint(hint)
                        }
                        unselectedCardGuesses.forEach { cardGuess in
                            cardGuess.applyHint(hint.opposite)
                        }
                    }
                    .modifier(ButtonModifier(color: .indigo))
                    
                    Button("Play/Discard 🎆") {
                        guard selectedCardGuesses.count == 1 else {
                            playButtonIsActive = false
                            return
                        }
                        playButtonIsActive = true
                        cardGuesses = unselectedCardGuesses
                        cardGuesses.append(CardGuess())
                    }
                    .modifier(ButtonModifier(color: playButtonIsActive ? .indigo : .orange))
                }
            }
        }
        .padding(5)
    }
}

extension ContentView {
    var selectedCardGuesses: [CardGuess] {
        cardGuesses.filter { $0.isSelected }
    }
    
    var unselectedCardGuesses: [CardGuess] {
        cardGuesses.filter { !$0.isSelected }
    }
    
    private struct ButtonModifier: ViewModifier {
        var color: Color
        
        func body(content: Content) -> some View {
            content
                .font(.system(size: 23))
                .bold()
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .foregroundStyle(.white)
                .background(in: .capsule)
                .backgroundStyle(color)
        }
    }
}

#Preview {
    ContentView()
}
