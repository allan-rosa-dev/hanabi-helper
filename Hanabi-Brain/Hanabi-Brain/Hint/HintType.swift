//
//  HintType.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

enum HintType: String, CaseIterable {
	case color, number
}

extension HintType: Identifiable {
	var id: Self { self }
}
