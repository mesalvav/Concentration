//
//  Concentration.swift
//  Concentration
//
//  Created by mariosalvatierra on 2/13/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

struct Concentration
{
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
    
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
    // play the game
    //
    mutating func chooseCard(at index:Int){ // index of the UI buttons
       // not matched cards
        assert(cards.indices.contains(index), "concentration.chooseCard(st: \(index) ): choosen index not in the state")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards matched
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards face up
//                for flipDownindex in cards.indices {
//                    cards[flipDownindex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init( \(numberOfPairsOfCards) ): you must have at least one pair of cards")
        
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // TODO: SHUFFLE THE cards
        
        for _ in cards {
            let myrandom = Int(arc4random_uniform(UInt32( numberOfPairsOfCards)))
            //print(myrandom)
            let appendThisCardAtEnd = cards.remove(at: myrandom)
            cards.append(appendThisCardAtEnd)
            //print(card.identifier)
        }
    }
}
