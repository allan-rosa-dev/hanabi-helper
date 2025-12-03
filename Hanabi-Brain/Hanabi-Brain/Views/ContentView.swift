//
//  ContentView.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

struct ContentView: View {
    let gameConfig = GameConfig(mode: .regular, numberOfPlayers: .two)
    
    @StateObject var gameBoard = GameBoard()
    
    @State var cardGuesses: [CardGuess] = [
        CardGuess(isFocused: true),
        CardGuess(),
        CardGuess(),
        CardGuess(),
        //        CardGuess(),
    ]
    
    @State var hint: Hint = Hint(category: .color, logic: .have, colorValue: .white, numberValue: .one)
    
    @State var playButtonIsActive = true
    @State var currentCardIndex: Int? = 0 {
        didSet {
            cardGuesses.forEach { $0.isFocused = false }
            if let currentCardIndex {
                cardGuesses[currentCardIndex].isFocused = true
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    PlayedCardsView()
                        .environmentObject(gameBoard)
                } label: {
                    Text("Played Cards 🔎")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack() {
                            ForEach(cardGuesses.indices, id: \.self) { index in
                                CardGuessView(cardGuess: cardGuesses[index])
                                    .containerRelativeFrame([.horizontal])
                                    .id(index)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $currentCardIndex)
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(25, for: .scrollContent)
                    .onChange(of: currentCardIndex ?? 0) { oldValue, newValue in
                        withAnimation {
                            setCurrentCard(at: newValue, proxy: proxy)
                        }
                    }
                    
                    // MinimapView
                    HStack() {
                        ForEach(cardGuesses.indices, id: \.self) { index in
                            CardSelectView(cardGuess: cardGuesses[index])
                                .simultaneousGesture(
                                    LongPressGesture()
                                        .onEnded { _ in
                                            withAnimation {
                                                setCurrentCard(at: index, proxy: proxy)
                                            }
                                        }
                                )
                        }
                    }
                    .padding(10)
                }
                
                HintPickerView(hint: $hint)
                
                HStack {
                    Button("Give Hint 💡") {
                        giveHint()
                    }
                    .modifier(ButtonModifier(color: .indigo))
                    
                    Button("Discard 🎆") {
                        discardSelectedCard()
                    }
                    .modifier(ButtonModifier(color: .indigo))
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
    
    private func setCurrentCard(at index: Int, proxy: ScrollViewProxy) {
        currentCardIndex = index
        proxy.scrollTo(index)
    }
    
    private func giveHint() {
        guard selectedCardGuesses.count > 0 else {
            // TODO: - Show popup with feedback "no selected cards to give hint"
            return
        }
        
        selectedCardGuesses.forEach { cardGuess in
            cardGuess.applyHint(hint)
        }
        
        unselectedCardGuesses.forEach { cardGuess in
            cardGuess.applyHint(hint.opposite)
        }
        
        deselectAllCards()
    }
    
    private func playSelectedCard() {
        // TODO: - implement play function
    }
    
    private func discardSelectedCard() {
        guard selectedCardGuesses.count > 0 else {
            // TODO: - Show popup with feedback "select at least 1 card to discard"
            return
        }
        // TODO: - inform deck manager what was discarded for deduction logic
        cardGuesses = unselectedCardGuesses
        cardGuesses.append(CardGuess())
    }
    
    private func deselectAllCards() {
        cardGuesses.forEach { $0.isSelected = false }
    }
}

#Preview {
    ContentView()
}
