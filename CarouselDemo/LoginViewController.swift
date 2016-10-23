//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonSuperview: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonInitialY = buttonSuperview.frame.origin.y
        buttonOffset = buttonInitialY - 120
        
        // does it matter which version is used?
        // UINavigationBar.appearance().setBackgroundImage(UIImage().init, for: .default)
        // UINavigationBar.appearance().shadowImage = UIImage.init()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        //TODO not working, fix it
        navigationController?.navigationItem.backBarButtonItem?.title = ""
        
        // scroll view
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 140
        
        // keyboard
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (Notification) in
            self.buttonSuperview.frame.origin.y = self.buttonOffset
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (Notification) in
            self.buttonSuperview.frame.origin.y = self.buttonInitialY
            self.scrollView.contentOffset.y = 0
        }
    }

    @IBAction func didTapOutsideKeyboard(_ sender: AnyObject) {
        view.endEditing(true)
    }
}
