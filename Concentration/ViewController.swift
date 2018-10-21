//
//  ViewController.swift
//  Concentration
//
//  Created by Bongumusa Mkhize on 2018/08/11.
//  Copyright © 2018 Bongumusa Mkhize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var flipCount = 0 {
        // property observer
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
        
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewModel()
        }else {
            print("card not set")
        }
    }
    
    func updateViewModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 1, green: 0.6804772019, blue: 0.128636539, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["⚽️", "🎾", "🏐", "🏉","🎱", "🏀","🏓", "🏸","🥅"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil,emojiChoices.count > 0  {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
        return emoji[card.identifier] ?? "?"
    }
    
    
    
}

