//
//  CardNumber.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

enum CardNumber: CaseIterable, Equatable {
	
	case one, two, three, four, five
}

extension CardNumber {
	var description: String {
		switch self {
		case .one:
			return "1"
		case .two:
			return "2"
		case .three:
			return "3"
		case .four:
			return "4"
		case .five:
			return "5"
		}
	}
}

extension CardNumber: Identifiable {
	
	var id: Self { self }
}
