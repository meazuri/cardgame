//
//  Card.swift
//  cardgame
//
//  Created by seintsan on 22/4/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import UIKit

struct Card : Hashable{
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    var hashValue : Int{
        return identifier
    }
    static func == (lhs: Card ,rhs: Card)-> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
