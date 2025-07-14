//
//  CardSelectView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 23/06/25.
//

import SwiftUI

struct CardSelectView: View {
    
    @ObservedObject var cardGuess: CardGuess
    
    var body: some View {
        
        VStack(spacing: 8) {
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundStyle(cardGuess.isFocused ? .black : .clear)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(color())
                    .onTapGesture {
                        cardGuess.isSelected.toggle()
                    }
                Text(text())
                    .bold()
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .stroke(color: .black)
            }
            .if(cardGuess.isSelected) { view in
                view.overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 5)
                }
            }
            .if(!cardGuess.isSelected) { view in
                view.overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 5)
                }
            }
        }
    }
    
    private func color() -> Color {
        if cardGuess.possibleColors.count == 1 {
            return cardGuess.possibleColors.first?.value ?? .gray
        } else {
            return .gray
        }
    }
    
    private func text() -> String {
        if cardGuess.possibleNumbers.count == 1, let number = cardGuess.possibleNumbers.first {
            return number.description
        } else {
            return "?"
        }
    }
}

#Preview("Default") {
    @Previewable @State var defaulted = CardGuess()
    @Previewable @State var onlyNumberDiscovered = CardGuess(possibleNumbers: [.one])
    @Previewable @State var onlyColorDiscovered = CardGuess(possibleColors: [.white])
    @Previewable @State var cardDiscovered = CardGuess(possibleNumbers: [.two], possibleColors: [.blue])
    
    HStack {
        CardSelectView(cardGuess: defaulted)
        CardSelectView(cardGuess: onlyNumberDiscovered)
        CardSelectView(cardGuess: onlyColorDiscovered)
        CardSelectView(cardGuess: cardDiscovered)
    }
}

#Preview("Selected") {
    @Previewable @State var defaulted = CardGuess(isSelected: true)
    @Previewable @State var onlyNumberDiscovered = CardGuess(isSelected: true, possibleNumbers: [.four])
    @Previewable @State var onlyColorDiscovered = CardGuess(isSelected: true, possibleColors: [.green])
    @Previewable @State var cardDiscovered = CardGuess(isSelected: true, possibleNumbers: [.three], possibleColors: [.red])
    HStack {
        CardSelectView(cardGuess: defaulted)
        CardSelectView(cardGuess: onlyNumberDiscovered)
        CardSelectView(cardGuess: onlyColorDiscovered)
        CardSelectView(cardGuess: cardDiscovered)
    }
}

#Preview("Focused") {
    @Previewable @State var defaulted = CardGuess(isFocused: true)
    @Previewable @State var onlyNumberDiscovered = CardGuess(isFocused: true, possibleNumbers: [.one])
    @Previewable @State var onlyColorDiscovered = CardGuess(isFocused: true, possibleColors: [.yellow])
    @Previewable @State var cardDiscovered = CardGuess(isFocused: true, possibleNumbers: [.five], possibleColors: [.yellow])
    
    HStack {
        CardSelectView(cardGuess: defaulted)
        CardSelectView(cardGuess: onlyNumberDiscovered)
        CardSelectView(cardGuess: onlyColorDiscovered)
        CardSelectView(cardGuess: cardDiscovered)
    }
}

#Preview("Selected & Focused") {
    @Previewable @State var defaulted = CardGuess(isSelected: true, isFocused: true)
    @Previewable @State var onlyNumberDiscovered = CardGuess(isSelected: true, isFocused: true, possibleNumbers: [.one])
    @Previewable @State var onlyColorDiscovered = CardGuess(isSelected: true, isFocused: true, possibleColors: [.blue])
    @Previewable @State var cardDiscovered = CardGuess(isSelected: true, isFocused: true, possibleNumbers: [.two], possibleColors: [.red])
    
    HStack {
        CardSelectView(cardGuess: defaulted)
        CardSelectView(cardGuess: onlyNumberDiscovered)
        CardSelectView(cardGuess: onlyColorDiscovered)
        CardSelectView(cardGuess: cardDiscovered)
    }
}
