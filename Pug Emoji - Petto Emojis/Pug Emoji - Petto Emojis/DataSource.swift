//
//  DataSource.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 8/18/17.
//
//

import Foundation

class DataSource {
    
    init(premium: Bool) {
        self.purchasedPremium = premium
        fillArray()
    }
    
    // Arrays to hold the names of each emoji
    private let freeEmojiArray = ["topping03", "topping04","topping04","topping04","topping04"]

    private let premiumEmojiArray = ["topping03", "topping04","topping03","topping03"]
    
    // Final content of array
    var content: [String] = []
    
    // Determines which emoji pack to use
    var purchasedPremium: Bool

    
    // Determine whether to load premium or free
    func fillArray(){
        if purchasedPremium{
            content = premiumEmojiArray
        }
        else{
            content = freeEmojiArray
        }
    }
}
    
