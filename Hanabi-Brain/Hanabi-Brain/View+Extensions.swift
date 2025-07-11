//
//  View+Extensions.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 08/07/25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        }
        else {
            self
        }
    }
}
