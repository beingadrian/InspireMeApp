//
//  QuoteGenerator.swift
//  InspireMe
//
//  Created by Adrian Wisaksana on 6/1/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

/**
 * An object that stores quotes and can return a randomly chosen one.
 */
class QuoteGenerator {

    // MARK: - Properties
    
    /**
     * A variable that stores all the quotes in an array.
     */
    var quotes: [Quote]
    
    // MARK: - Initializer
    
    /**
     * The designated initializer for Quote Generator that accepts an array of quotes.
     */
    init(quotes: [Quote]) {
        
        self.quotes = quotes
        
    }
    
    // MARK: - Methods
    
    /**
     * Generates a random quote.
     * 
     * - returns: A optional Quote. It is optional because in the case that
     * the quotes array is empty, there will be no quote to return, and thus
     * it will be nil.
     */
    func generateRandomQuote() -> Quote? {
        
        guard !quotes.isEmpty else { return nil }
        
        let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        
        return quotes[randomIndex]
        
    }
    
}
