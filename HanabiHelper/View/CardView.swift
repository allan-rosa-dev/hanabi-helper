//
//  CardView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 20/07/23.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: GameCard
    @State private var isFacingFront: Bool
    @State private var animate3d: Bool

    init(card: GameCard?) {
        self.isFacingFront = true
        self.animate3d = false

        if let card {
            self.card = card
        } else {
            self.card = GameCard(color: .multicolor, number: .invalid(text: "?"))
        }
    }



    var body: some View {

        let flipDegrees = isFacingFront ? 180.0 : 0.0

        ZStack {
            K.backgroundColor
                .opacity(0.0)
            CardBackView()
                .opacity(isFacingFront ? 0.0 : 1.0)
            CardFrontView(text: card.number.description(), color: card.color.color())
                .opacity(isFacingFront ? 1.0 : 0.0)
        }
        .modifier(FlipEffect(isFacingFront: $isFacingFront, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
        .onTapGesture(count: 2) {
            withAnimation(Animation.linear(duration: 0.8)) {
                self.animate3d.toggle()
            }
        }
    }
}

// MARK: - Animation
struct FlipEffect: GeometryEffect {
    @Binding var isFacingFront: Bool
    var angle: Double
    let axis: (x: CGFloat, y: CGFloat)

    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.isFacingFront = self.angle >= 90 && self.angle < 270
        }
        let tweakedAngle = isFacingFront ? -180 + angle : angle
        let angleCGFloat = CGFloat(Angle(degrees: tweakedAngle).radians)

        var transform3d = CATransform3DIdentity;
        transform3d.m34 = -1/max(size.width, size.height)

        transform3d = CATransform3DRotate(transform3d, angleCGFloat, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)

        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0))

        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}

extension View {
    func flip(degrees: Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

// MARK: - Previews
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: GameCard(color: .multicolor, number: .invalid(text: "?")))
    }
}
