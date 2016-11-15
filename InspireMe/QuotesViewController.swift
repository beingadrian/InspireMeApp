//
//  QuotesViewController.swift
//  InspireMe
//
//  Created by Adrian Wisaksana on 6/1/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let quoteGenerator = QuoteGenerator(quotes: [])
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuotes()
        
        displayRandomQuote(animated: false)
        
    }
    
    /**
     * Creates hard-coded quotes that are going to be added into the `QuoteGenerator`'s 
     * quotes array property.
     */
    func setQuotes() {
        
        // create quotes
        
        let quoteA = Quote(author: "Unknown",
                           quote: "Love your life.",
                           backgroundColor: Colors.blue)
        
        let quoteB = Quote(author: "Hamlet",
                           quote: "To be or not to be, that is the question.",
                           backgroundColor: Colors.red)
        
        let quoteC = Quote(author: "Darth Vader",
                           quote: "I am your father.",
                           backgroundColor: Colors.purple)
        
        let quoteD = Quote(author: "Gandalf",
                           quote: "You shall not pass!",
                           backgroundColor: Colors.orange)
        
        let quoteE = Quote(author: "Master Yoda",
                           quote: "Do or do not. There is no try.",
                           backgroundColor: Colors.orange)
        
        // add quotes to the quotes array
        quoteGenerator.quotes = [
            quoteA,
            quoteB,
            quoteC,
            quoteD,
            quoteE
        ]
        
    }
    
    /**
     * Uses the quote generator to generate a quote and then displays it on the screen
     * by manipulating the labels' `text` property. 
     *
     * Also changes the background colour using the quote's background colour property.
     */
    func displayRandomQuote(animated: Bool) {
        
        // guard (make sure) that `randomQuote` is not nil, otherwise execute the else block
        guard let randomQuote = quoteGenerator.generateRandomQuote() else {
            // if `randomQuote` is nil, then display to the user that there are no quotes
            quoteLabel.text = "You have no quotes (literally)."
            authorLabel.text = "- The Grand Console"
            view.backgroundColor = UIColor.darkGray
            return
        }
        
        // make sure animated is true, otherwise do not animate
        guard animated else {
            quoteLabel.text = randomQuote.quote
            authorLabel.text = "- \(randomQuote.author)"
            view.backgroundColor = randomQuote.backgroundColor
            return
        }

        // fade out animation
        UIView.animate(withDuration: 0.23, animations: {
            self.quoteLabel.alpha = 0
            self.authorLabel.alpha = 0
        }, completion: { (finished) in
            // ensure that the fade in animation is only executed when fade out is complete
            guard finished else { return }
            // fade in animation
            UIView.animate(withDuration: 0.23, animations: {
                self.quoteLabel.alpha = 1
                self.authorLabel.alpha = 1
                self.quoteLabel.text = randomQuote.quote
                self.authorLabel.text = "- \(randomQuote.author)"
                self.view.backgroundColor = randomQuote.backgroundColor
            }) 
        }) 
        
    }
    
    // Alt-Click on the method to read what it does
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction func onInspireButtonTap(_ sender: UIButton) {
        
        // when the button is pressed, display a random quote with animation
        displayRandomQuote(animated: true)
        
    }
    
}
