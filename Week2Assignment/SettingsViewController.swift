//
//  SettingsViewController.swift
//  Week2Assignment
//
//  Created by Padmaja Ragavendra on 5/28/16.
//  Copyright © 2016 Padmaja Ragavendra. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet weak var SignoutButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dismissButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = imageView.image!.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onDismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
     @IBAction func onSignOutTap(sender: AnyObject) {
            let alertController = UIAlertController(title: "Title", message: "Are you sure you wnat to signout", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            // handle case of user logging out
            self.performSegueWithIdentifier("signoutSegue", sender: self)
            
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
