//
//  CardNumber.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

enum CardNumber: CaseIterable, Equatable {
    
    case one, two, three, four, five
    
    var value: Int {
        switch self {
        case .one: 1
        case .two: 2
        case .three: 3
        case .four: 4
        case .five: 5
        }
    }
    
    var next: CardNumber? {
        switch self {
        case .one: .two
        case .two: .three
        case .three: .four
        case .four: .five
        case .five: nil
        }
    }
    
    var totalCount: Int {
        switch self {
        case .one: 3
        case .two, .three, .four: 2
        case .five: 1
        }
    }
}

extension CardNumber: CustomStringConvertible {
    var description: String {
        switch self {
        case .one: "1"
        case .two: "2"
        case .three: "3"
        case .four: "4"
        case .five: "5"
        }
    }
}

extension CardNumber: Identifiable {
    
    var id: Self { self }
}
