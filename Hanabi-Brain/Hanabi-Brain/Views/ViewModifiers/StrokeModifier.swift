//
//  StrokeModifier.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 14/07/25.
//

import SwiftUI

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    
    var size: CGFloat = 1
    var color: Color = .black
    
    func body(content: Content) -> some View {
        if size > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }
    
    @ViewBuilder
    func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(size*2)
            .background(
                Rectangle()
                    .foregroundColor(color)
                    .mask(alignment: .center, {
                        mask(content: content)
                    })
            )
    }
    
    @ViewBuilder
    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: size)
        }
    }
}

extension View {
    func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(size: width, color: color))
    }
}
