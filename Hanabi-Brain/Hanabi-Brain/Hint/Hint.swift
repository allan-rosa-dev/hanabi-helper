//
//  Hint.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

enum Hint {
	case colorHint(have: HintLogic, color: CardColor)
	case numberHint(have: HintLogic, number: CardNumber)
}

extension Hint {
	var description: String {
		switch self {
		case .colorHint(have: let has, color: let color):
				return "\(has.rawValue) \(color.description)"
		case .numberHint(have: let has, number: let number):
				return "\(has.rawValue) \(number.description)"
		}
	}
	
	var color: Color {
		switch self {
			case .colorHint(have: _, color: let color):
				return color.value
			default:
				return .black
		}
	}
	
	var type: HintType {
		switch self {
			case .colorHint(have: _, color: _):
				return .color
			case .numberHint(have: _, number: _):
				return .number
		}
	}
}

extension Hint: Hashable {
	func hash(into hasher: inout Hasher) {
		switch self {
		case .colorHint(have: let has, color: let color):
			hasher.combine(has)
			hasher.combine(color)
		case .numberHint(have: let has, number: let number):
			hasher.combine(has)
			hasher.combine(number)
		}
	}
}



