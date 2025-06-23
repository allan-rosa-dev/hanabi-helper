//
//  HintPickerView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 20/06/25.
//

import SwiftUI

struct HintPickerView: View {
    @Binding var hint: Hint
    
    var body: some View {
        VStack {
            Divider()
            
            Text("Giving \(hint.category) hint: \(hint.description) ")
            
            Divider()
            
            Picker("HintTypePicker", selection: $hint.category) {
                ForEach(Hint.Category.allCases) { category in
                    Text(category.description.capitalized)
                }
            }
            .pickerStyle(.palette)
            .padding()
            
            HStack() {
                Picker("LogicPicker", selection: $hint.logic) {
                    ForEach(Hint.Logic.allCases) { logic in
                        Text(logic.description.capitalized)
                    }
                }
                .pickerStyle(.menu)
                .tint(.black)
                .padding()
                
                switch hint.category {
                case .color:
                    Picker("ColorPicker", selection: $hint.colorValue) {
                        ForEach(CardColor.allCases) { color in
                            Text(color.description.capitalized)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.black)
                    
                case .number:
                    Picker("NumberPicker", selection: $hint.numberValue) {
                        ForEach(CardNumber.allCases) { number in
                            Text(number.description.capitalized)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.black)
                }
            }
            
        }
    }
}

#Preview {
    @Previewable @State var hint = Hint(category: .number, logic: .have, colorValue: .white, numberValue: .one)
    
    HintPickerView(hint: $hint)
}
