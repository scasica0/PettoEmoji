//
//  HelpController.swift
//  Pug Emoji - Petto Emojis
//
//  Created by steve on 8/24/17.
//
//

import UIKit

class HelpController: UIViewController {

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
    
    @IBAction func openMoreEmojis(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://www.pettoemoji.com")!, options: [:], completionHandler: nil)
    }
    

}
