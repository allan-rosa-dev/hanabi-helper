//
//  Checkbox.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 29/07/23.
//

import SwiftUI

struct Checkbox: View {
    // MARK: - Attributes
    let text: String
    @State var isMarked: Bool

    // MARK: - Init
    init(text: String = "", isMarked: Bool = false) {
        self.text = text
        self.isMarked = isMarked
    }

    // MARK: - Design
    var body: some View {
        Image(systemName: isMarked ? "checkmark.square" : "square")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(isMarked ? .accentColor : .gray)
            .font(.system(size: 24, weight: .regular, design: .default))
            .onTapGesture {
                isMarked.toggle()
            }
    }
}
