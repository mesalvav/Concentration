//
//  Card.swift
//  Concentration
//
//  Created by mariosalvatierra on 2/13/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier:Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier()-> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
