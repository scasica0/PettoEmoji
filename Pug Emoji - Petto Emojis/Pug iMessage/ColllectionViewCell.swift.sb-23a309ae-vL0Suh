//
//  emojiCell.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 9/21/17.
//
//

import UIKit
import Messages

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var stickerView: MSStickerView!
    func configure(usingImageName imageName:String) {
        guard let imagePath = Bundle.main.path(forResource: "Stickers/" + imageName, ofType: ".png") else {
            return
        }
        let path =  URL(fileURLWithPath: imagePath)
        do {
            let description = NSLocalizedString("Emoji Sticker", comment: "")
            let sticker = try MSSticker(contentsOfFileURL: path , localizedDescription: description)
            stickerView.sticker = sticker
        }
        catch {
            fatalError("Failed to create emoji sticker: \(error)")
        }
    }

}

