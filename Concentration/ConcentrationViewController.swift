//
//  ViewController.swift
//  Concentration
//
//  Created by mariosalvatierra on 2/11/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards:Int {
        return (cardButtons.count + 1) / 2
    }
    
    func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString =
            NSAttributedString(string: "Flips: \(flipCount)", attributes:   attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
   
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel(){
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                } else {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) :#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
        }
        
        
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = "🎃👻🦇🙀😈🍭🍖🍎😱"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let ransomstringIndex =
                    emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            
            emoji[card] = String( emojiChoices.remove(at: ransomstringIndex) )
        }
        
        return emoji[card] ?? "?"
        
    }
}

extension  Int {
    var arc4random:Int {
        if self > 0 {
            return Int( arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int( arc4random_uniform(UInt32(self)))
        }
        else {
            return 0
        }
    }
}
// 51:46 dictionary
