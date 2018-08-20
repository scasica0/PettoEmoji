//
//  DataSource.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 9/21/17.
//
//

import Foundation

class DataSource {
    
    init(premium: Bool) {
        self.purchasedPremium = premium
        fillArray()
    }
    
    // Arrays to hold the names of each emoji
    private let freeEmojiArray = ["cake1", "cake2","cake3","cake4","cake5"]
    
    private let premiumEmojiArray = ["drink1", "drink2","drink3","drink4"]
    
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
    
