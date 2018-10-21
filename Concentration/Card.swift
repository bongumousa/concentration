//
//  Card.swift
//  Concentration
//
//  Created by Bongumusa Mkhize on 2018/08/17.
//  Copyright © 2018 Bongumusa Mkhize. All rights reserved.
//

import Foundation

struct Card{
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierfactory = 0
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
        self.isFacedUp = false
        self.isMatched = false
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierfactory += 1
        return identifierfactory
    }
}
