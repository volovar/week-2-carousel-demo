//
//  FeedViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var bannerSuperview: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImage.frame.size
        scrollView.contentInset.top = 51
        scrollView.contentOffset.y = -54
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "feed_view_title_image"))
        
        // for future ref: add this to the view that the next view will return to
        // eg: I was adding this to the conversations view and it wasn't doing anything...
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkBannerStatus()
    }
    
    func hideBanner() {
        UIView.animate(withDuration: 0.4) {
            self.bannerSuperview.transform = CGAffineTransform(translationX: 0, y: -51)
            self.bannerSuperview.alpha = 0
            
            self.scrollView.contentInset.top = 64
        }
    }
    
    // checks if all values in 'checklist' are true and hides the banner if they are
    func checkBannerStatus() {
        if checklist["didViewPhoto"] == true && checklist["didSwipePhoto"] == true && checklist["didSharePhoto"] == true {
            hideBanner()
        }
    }
    
    @IBAction func didPressCloseBanner(_ sender: AnyObject) {
        checklist[""] = true
        
        hideBanner()
    }
    
    @IBAction func didSwipeRight(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset.y = 189
        }
        
        checklist["didSwipePhoto"] = true
        
        checkBannerStatus()
    }
  
    @IBAction func didSwipeLeft(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset.y = -115
        }
    }
    
    @IBAction func didPressViewDetail(_ sender: AnyObject) {
//        prepare(for: UIStoryboardSegue, sender: UIButton.self)
    }
}
