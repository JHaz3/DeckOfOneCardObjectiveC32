//
//  DMVCardViewController.swift
//  DeckOfOneCardObjectiveC32
//
//  Created by Jake Haslam on 3/24/20.
//  Copyright © 2020 Jake Haslam. All rights reserved.
//

import UIKit

class DMVCardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardButton: UIButton!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCardButton.layer.cornerRadius = drawCardButton.frame.width/0.5
        self.fetchCards()
        
    }
    
    //MARK: - Actions
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        self.fetchCards()
    }
    
    //MARK: - Helper Functions
    func fetchCards() {
        DMVCardController.drawNewCard(1) { (cards) in
            if let cards = cards {
                DMVCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    
    func updateViews(card: DMVCard, image: UIImage) {
        
        self.cardImageView.image = image
        self.suitLabel.text = card.suit
        
        switch card.suit {
        case "DIAMONDS":
            self.drawCardButton.backgroundColor = .systemRed
            self.suitLabel.textColor = .systemRed
        case "HEARTS":
            self.drawCardButton.backgroundColor = .systemRed
            self.suitLabel.textColor = .systemRed
        case "SPADES":
            self.drawCardButton.backgroundColor = .black
            self.suitLabel.textColor = .black
        case "CLUBS":
            self.drawCardButton.backgroundColor = .black
            self.suitLabel.textColor = .black
        default:
            break
            
        }
    }
}// End of Class
