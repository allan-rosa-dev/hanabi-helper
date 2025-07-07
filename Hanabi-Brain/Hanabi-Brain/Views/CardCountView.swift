//
//  CardCountView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import SwiftUI

struct CardCountView: View {
    @State var number: CardNumber
    
    @Binding var whiteCount: Int
    @Binding var redCount: Int
    @Binding var greenCount: Int
    @Binding var blueCount: Int
    @Binding var yellowCount: Int
    
    var body: some View {
        CardNumberCountView(labelText: number.description, whiteCount: $whiteCount, redCount: $redCount, greenCount: $greenCount, blueCount: $blueCount, yellowCount: $yellowCount)
            .padding()
            .background(.gray)
//        Button("Test"){
//            whiteCount += 1
//            print("update count")
//            print(whiteCount)
//        }
    }
}

#Preview {
    @Previewable @State var whiteCount = 0
    @Previewable @State var redCount = 1
    @Previewable @State var greenCount = 3
    @Previewable @State var blueCount = 0
    @Previewable @State var yellowCount = 2


    CardCountView(number: .one, whiteCount: $whiteCount, redCount: $redCount, greenCount: $greenCount, blueCount: $blueCount, yellowCount: $yellowCount)
}

struct CircleStackView: View {
    @Binding var filledCircles: Int
    let maxCircles: Int
    let color: Color
    let size: CGFloat = 20
    
    var body: some View {
        Grid(horizontalSpacing: 10) {
            GridRow() {
                ForEach(0..<3) { i in
                    if i < filledCircles {
                        Circle()
                            .fill(color)
                            .frame(width: size, height: size)
                    } else {
                        Circle()
                            .stroke(color, lineWidth: 5)
                            .fill(.gray)
                            .frame(width: size, height: size)
                    }
                }
            }
        }
    }
}

struct CardNumberCountView: View {
    @State var labelText: String
    @Binding var whiteCount: Int
    @Binding var redCount: Int
    @Binding var greenCount: Int
    @Binding var blueCount: Int
    @Binding var yellowCount: Int
    
    var body: some View {
        HStack() {
            Text(labelText)
                .font(.largeTitle)
                .frame(alignment: .trailing)
                .scaledToFill()
            
            VStack {
                CircleStackView(filledCircles: $whiteCount, maxCircles: 3, color: .white)
                CircleStackView(filledCircles: $redCount, maxCircles: 3, color: .red)
                CircleStackView(filledCircles: $greenCount, maxCircles: 3, color: .green)
                CircleStackView(filledCircles: $blueCount, maxCircles: 3, color: .blue)
                CircleStackView(filledCircles: $yellowCount, maxCircles: 3, color: .yellow)
            }
        }
    }
}
