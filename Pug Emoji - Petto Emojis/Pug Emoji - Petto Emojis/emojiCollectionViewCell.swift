//
//  emojiCollectionViewCell.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 8/8/17.
//
//

import UIKit

class emojiCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var emojiImage: UIImageView!
    
    // this prevents certain images form being selected if premium is not purchased
    var locked: Bool = false
    }
