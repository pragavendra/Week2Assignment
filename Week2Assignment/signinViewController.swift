//
//  signinViewController.swift
//  Week2Assignment
//
//  Created by Padmaja Ragavendra on 5/24/16.
//  Copyright © 2016 Padmaja Ragavendra. All rights reserved.
//

import UIKit

class signinViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!


    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120


    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
       
        let alertController = UIAlertController(title: "Email/Password Required", message: "Please enter Email and Password", preferredStyle: .Alert)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        alertController.addAction(cancelAction)
        
        // Code that runs if either the email or password do NOT match the text we are looking for in each case
        let alertControllerPasswordcheck = UIAlertController(title: "Email/Password Incorrect", message: "Please enter Email and Password", preferredStyle: .Alert)
   
        let cancelActionPasswordCheck = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
        }
        alertControllerPasswordcheck.addAction(cancelActionPasswordCheck)
        

        
        
        if (emailField.text!.isEmpty || passwordField.text!.isEmpty){
            print("emailfieldempty")
           presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
            }
        }
            
        else {
            print("emailfieldnotempty")
            self.loginIndicator.startAnimating()
            signinButton.selected = true
            
            if self.emailField.text == "padmaja" && self.passwordField.text == "padmaja" {
                // Code that runs if both email and password match the text we are looking for in each case
                print("password ok")
                
                delay(2, closure: { () -> () in
                    // Stop animating the activity indicator.
                    self.loginIndicator.stopAnimating()
                    // Set the button state back to default, "Not Selected".
                    self.signinButton.selected = false
                    // perform the Segue to the next screen.
                    self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                })

                
                
            } else {
                print("password not ok")
                delay(2, closure: { () -> () in
                    // Stop animating the activity indicator.
                    self.loginIndicator.stopAnimating()
                    // Set the button state back to default, "Not Selected".
                    self.signinButton.selected = false
                    // Create and Show UIAlertController...see guide, Using UIAlertController
                })
                self.presentViewController(alertControllerPasswordcheck, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                }

            }
        }
    
    }
}



