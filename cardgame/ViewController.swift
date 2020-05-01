//
//  ViewController.swift
//  cardgame
//
//  Created by seintsan on 22/4/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int{
        get{
            return (cardButtons.count+1)/2
        }
    }
    var emojiesChoices = ["🦇","😱","🙀","😈","🎃","👻",
                    "🍭","🍬","🍎"]
    private(set) var flipCount = 0 {
        didSet{
            
            flipCountLabel.text = "Flips :\(flipCount)"
        }
    }
   private var emoji = [Card:String]()
    func emoji (for card : Card) -> String {
        
        if emoji[card] == nil , emojiesChoices.count > 0 {
            let randomIndex = emojiesChoices.count.arc4random
            emoji[card] = emojiesChoices.remove(at: randomIndex)
        }
        
        return emoji[card] ?? "?"
    }
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp  {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)

            }else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
            
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let card = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: card)
            updateViewFromModel()
        }else{
            print("chosen card was not in carbuttons")
        }
    }
   
   
//    func flipCard(withEmoji emoji: String , on Button :UIButton) {
//        if Button.currentTitle == emoji {
//            Button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//            Button.setTitle("", for: UIControl.State.normal)
//        }else{
//            Button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            Button.setTitle(emoji, for: UIControl.State.normal)        }
//    }
    
}
extension Int {
       var arc4random: Int{
        if self > 0 {
           return Int( arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int( arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
       }
   }
