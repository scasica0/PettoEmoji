//
//  MessageViewController.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 9/21/17.
//
//

import UIKit
import Messages

let reuseIdentifier = "Cell"

class MessageViewController: MSMessagesAppViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //create instance of DataSource
    var emojiData = DataSource(premium: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiData.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        let imageName = emojiData.content[indexPath.item]
        cell.configure(usingImageName: imageName)
        
        
        // lock certain images if premium is not purchased
        if (!emojiData.purchasedPremium){
            if (indexPath.item > 1){
                cell.stickerView.isUserInteractionEnabled = false
            }
            else{
                cell.stickerView.isUserInteractionEnabled = true
            }
        }
        else {
            cell.stickerView.isUserInteractionEnabled = true
        }
        
        
        return cell
    }
    
    
    //If a locked sticker is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        if (cell.stickerView.isUserInteractionEnabled == false) {
            displayAlert(lockStatus: "This Sticker is locked")
        }
    }
    
    // Display alert that sticker is locked
    func displayAlert(lockStatus: String){
        
        let lockAlert = UIAlertController(title: "", message: lockStatus, preferredStyle:UIAlertControllerStyle.alert)
        self.present(lockAlert, animated: true, completion: nil)
        
        // Automatically dismiss alert after 0.75 seconds
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
            lockAlert.dismiss(animated: true, completion: nil)
        }
    }

}
