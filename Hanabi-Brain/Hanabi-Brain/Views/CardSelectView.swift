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
                .foregroundStyle(cardGuess.isOnMainDisplay ? .black : .clear)
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
    @Previewable @State var cardGuess = CardGuess()
    CardSelectView(cardGuess: cardGuess)
}

#Preview("Selected") {
    @Previewable @State var cardGuess = CardGuess(isSelected: true)
    CardSelectView(cardGuess: cardGuess)
}

#Preview("MainDisplay") {
    @Previewable @State var cardGuess = CardGuess(isOnMainDisplay: true)
    CardSelectView(cardGuess: cardGuess)
}

#Preview("Selected OnMainDisplay") {
    @Previewable @State var cardGuess = CardGuess(isSelected: true, isOnMainDisplay: true)
    CardSelectView(cardGuess: cardGuess)
}
