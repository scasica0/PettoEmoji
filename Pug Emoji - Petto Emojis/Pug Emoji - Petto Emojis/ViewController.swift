//
//  ViewController.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 8/8/17.
//
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: Variables
    
    //reuse identifier for cells
    private let reuseIdentifier = "emojiCell"
    
    //create instance of DataSource
    var emojiData = DataSource(premium: false)
    
    //variable to hold selected emoji to copy
    var selectedIndexPath: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    //MARK: Collection View Initialization

    
    //Set the number of cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiData.content.count
    }
    
    //Create a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! emojiCollectionViewCell
        
        // attach the image from assets to cell
        cell.emojiImage.image = UIImage(named: emojiData.content[indexPath.item])
        
        // lock certain images if premium is not purchased
        if (!emojiData.purchasedPremium){
            if (indexPath.item > 1){
                cell.locked = true
            }
            else{
                cell.locked = false
            }
        }
        else {
            cell.locked = false
        }
            
        
        return cell
    }
      
    
    //Copy image from a cell that is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! emojiCollectionViewCell
        
        // copy cell image if it is not locked to pasteboard and display success or failure
        if (cell.locked == false) {
            UIPasteboard.general.image = cell.emojiImage.image
            
            if UIPasteboard.general.image == cell.emojiImage.image {
                displayAlert(copyStatus: "Image copied \n to clipboard")
            }
            else {
                displayAlert(copyStatus: "Failure: image NOT copied")
            }
        }
    }


    // Display alert that image has or has no been copied
    func displayAlert(copyStatus: String){
        
        let copyAlert = UIAlertController(title: "", message: copyStatus, preferredStyle:UIAlertControllerStyle.alert)
        self.present(copyAlert, animated: true, completion: nil)
    
        // Automatically dismiss alert after 0.75 seconds
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
            copyAlert.dismiss(animated: true, completion: nil)
        }
    }

}

