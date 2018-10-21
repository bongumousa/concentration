//
//  Concentration.swift
//  Concentration
//
//  Created by Bongumusa Mkhize on 2018/08/17.
//  Copyright © 2018 Bongumusa Mkhize. All rights reserved.
//

import Foundation

class Concentration {
    
 
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int){
        if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
            if(cards[matchIndex].identifier == cards[index].identifier){
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUp = nil
        }else{
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFacedUp = false
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUp = index
        }
    }
    
    init (numberOfPairsOfCards: Int){
        
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO - Shuffle cards
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards[randomIndex] = cards[index]
            cards[index] = cards[randomIndex]
        }

    }
    
}
