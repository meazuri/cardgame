//
//  Concentration.swift
//  cardgame
//
//  Created by seintsan on 22/4/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    //computed property

    private var indexOfOneAndOnlyFaceUpCard : Int? {
        
        get{
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                        
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            
            if let matchIndex =  indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else {
                indexOfOneAndOnlyFaceUpCard = index
            }
           
        }
        
    }
    
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            
        }
    }

}
