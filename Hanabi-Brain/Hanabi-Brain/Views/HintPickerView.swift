//
//  HintPickerView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 20/06/25.
//

import SwiftUI

struct HintPickerView: View {
    @Binding var hint: Hint
    
    @ScaledMetric var pickerSpacing = 5
    
    var body: some View {
        VStack {
            HStack(spacing: pickerSpacing) {
                Picker("LogicPicker", selection: $hint.logic) {
                    ForEach(Hint.Logic.allCases) { logic in
                        Text(logic.description.capitalized)
                    }
                }
                .modifier(PickerSubViewModifier())
                                
                Picker("HintTypePicker", selection: $hint.category) {
                    ForEach(Hint.Category.allCases) { category in
                        Text(category.description.capitalized)
                    }
                }
                .modifier(PickerSubViewModifier())
                
                switch hint.category {
                case .color:
                    Picker("ColorPicker", selection: $hint.colorValue) {
                        ForEach(CardColor.allCases) { color in
                            Text(color.description.capitalized)
                        }
                    }
                    .modifier(PickerSubViewModifier())
                    
                case .number:
                    Picker("NumberPicker", selection: $hint.numberValue) {
                        ForEach(CardNumber.allCases) { number in
                            Text(number.description.capitalized)
                        }
                    }
                    .modifier(PickerSubViewModifier())
                }
            }
        }
    }
}

extension HintPickerView {
    private struct PickerSubViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .pickerStyle(.menu)
                .tint(.black)
                .border(.red)
        }
    }
}

#Preview {
    @Previewable @State var hint = Hint(category: .number, logic: .have, colorValue: .white, numberValue: .one)
    
    HintPickerView(hint: $hint)
}
