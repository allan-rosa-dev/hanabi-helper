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
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 50, height: 50)
                .foregroundStyle(cardGuess.isSelected ? .black : .brown)
                .onTapGesture {
                    cardGuess.isSelected.toggle()
                }
            Text("?")
                .foregroundStyle(.white)
        }
        .if(cardGuess.isOnMainDisplay) { view in
            view.overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.indigo, lineWidth: 5)
            }
        }
        .if(!cardGuess.isOnMainDisplay) { view in
            view.overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 5)
            }
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
