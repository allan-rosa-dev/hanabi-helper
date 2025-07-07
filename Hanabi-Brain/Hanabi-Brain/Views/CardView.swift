//
//  CardView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import SwiftUI

struct CardView: View {
    @State var card: Card?
    @State var emptyText: String = "Empty"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(card?.color.value ?? .brown)
            Text(card?.number.description ?? emptyText)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .scaledToFill()
        }
    }
}

#Preview("🟦3") {
    CardView(card: Card(color: .blue, number: .three))
}

#Preview("🟨5") {
    CardView(card: Card(color: .yellow, number: .five))
}

#Preview("Empty") {
    CardView(emptyText: "Empty Custom Text")
}
