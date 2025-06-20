//
//  HintLogic.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

enum HintLogic: String, CaseIterable {
	
	case have = "Have"
	case doesntHave = "Doesn't have"
}

extension HintLogic {
	var value: Bool {
		switch self {
		case .have:
			return true
		case .doesntHave:
			return false
		}
	}
}

extension HintLogic: Identifiable {
	var id: Self { self }
}
