//
//  Concentration.swift
//  Concentration
//
//  Created by mariosalvatierra on 2/13/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

class Concentration
{
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // play the game
    //
    func chooseCard(at index:Int){ // index of the UI buttons
       // not matched cards
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards matched
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards face up
                for flipDownindex in cards.indices {
                    cards[flipDownindex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // TODO: SHUFFLE THE cards
        
        for card in cards {
            let myrandom = Int(arc4random_uniform(UInt32( numberOfPairsOfCards)))
            print(myrandom)
            let appendThisCardAtEnd = cards.remove(at: myrandom)
            cards.append(appendThisCardAtEnd)
            print(card.identifier)
        }
    }
}
