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
                    ForEach(cardGuess.possibleColors) { color in
                        GridRow() {
                            ForEach(cardGuess.possibleNumbers) { number in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(color.value)
                                        .frame(width: 50, height: 80, alignment: .center)
                                    Text("\(number.description)")
                                        .font(.system(size: 50))
                                }
                            }
                        }
                    }
                }
                .padding(.all, 5)
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
