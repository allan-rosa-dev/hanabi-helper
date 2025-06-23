//
//  CardGuessView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 23/06/25.
//

import SwiftUI

struct CardGuessView: View {
    
    @ObservedObject var cardGuess: CardGuess
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(cardGuess.isSelected ? .black : .gray)
            VStack {
                Grid(alignment: .center, horizontalSpacing: 5, verticalSpacing: 5) {
                    ForEach(CardColor.allCases) { color in
                        GridRow() {
                            ForEach(CardNumber.allCases) { number in
                                if cardGuess.possibleColors.contains(color) && cardGuess.possibleNumbers.contains(number) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(color.value)
                                            .frame(width: 50, height: 80, alignment: .center)
                                        Text("\(number.description)")
                                            .font(.system(size: 50))
                                    }
                                } else {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.brown)
                                        .frame(width: 50, height: 80, alignment: .center)
                                        .gridCellUnsizedAxes([.horizontal, .vertical])
                                }
                            }
                        }
                    }
                }
            }
        }
        .onTapGesture {
            cardGuess.isSelected.toggle()
        }
    }
}

#Preview {
    CardGuessView(cardGuess: CardGuess())
}
