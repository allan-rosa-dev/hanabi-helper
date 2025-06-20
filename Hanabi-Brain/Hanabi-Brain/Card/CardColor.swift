//
//  CardColor.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

enum CardColor: CaseIterable, Equatable {
	
	case white, red, green, blue, yellow
}

extension CardColor {
	var value: Color {
		switch self {
			case .white:
				return .white
			case .red:
				return .red
			case .green:
				return .green
			case .blue:
				return .blue
			case .yellow:
				return .yellow
		}
	}
	
	var description: String {
		switch self {
			case .white:
				return "⬜️"
			case .red:
				return "🟥"
			case .green:
				return "🟩"
			case .blue:
				return "🟦"
			case .yellow:
				return "🟨"
		}
	}
}

extension CardColor: Identifiable {
	var id: Self { self }
}
