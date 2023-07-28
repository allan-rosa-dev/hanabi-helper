//
//  GameMode.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

enum GameMode {
    
    case regular

    case extraSuitFull      // Variant 1 - All Multicolor cards are added (Extra 10 cards) - They CAN be called as "Multicolor" color
                            // Think of it as if it was a separate set of "Purple" for example, there's one extra set of fireworks that's independent

    case extraSuitSingle    // Variant 2 - A single Multicolor card of each number is added (extra 5 cards)
                            // Same as Variant 1, except that if you discard any one of those, you can't obtain the max score as there are no copies of this set

    case extraSuitWildcard  // Variant 3 - All Multicolor cards are added - They CANNOT be called as "Multicolor" color
                            // - they instead count as all colors despite being their own set!
                            // For example, if you hint "Red", you have to point at every card that is either Red or Multicolor
}
