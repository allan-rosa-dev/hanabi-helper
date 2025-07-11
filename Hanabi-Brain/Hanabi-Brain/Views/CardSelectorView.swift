//
//  CardSelectorView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 23/06/25.
//

import SwiftUI

struct CardSelectView: View {
    
    @ObservedObject var cardGuess: CardGuess
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 50, height: 50)
            .foregroundStyle(cardGuess.isSelected ? .black : .gray)
            .onTapGesture {
                cardGuess.isSelected.toggle()
            }
            .if(cardGuess.isOnMainDisplay) { view in
                view.overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.cyan, lineWidth: 2)
                }
            }
    }
}

#Preview {
    CardSelectView(cardGuess: CardGuess())
}
