//
//  TutorialViewController.swift
//  Week2Assignment
//
//  Created by Padmaja Ragavendra on 5/28/16.
//  Copyright © 2016 Padmaja Ragavendra. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var carouselButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        scrollView.delegate = self
         scrollView.contentSize = CGSize(width: 1280, height: 583)
        carouselButton.alpha = 0
        
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        print ("page:" ,page)
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        if (page == 3 ){
            pageControl.hidden = true
            carouselButton.alpha = 1
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
