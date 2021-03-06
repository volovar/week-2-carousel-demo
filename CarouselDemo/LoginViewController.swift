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
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var buttonSuperview: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonInitialY = buttonSuperview.frame.origin.y
        buttonOffset = buttonInitialY - 120
        
        // does it matter which version is used?
        // UINavigationBar.appearance().setBackgroundImage(UIImage().init, for: .default)
        // UINavigationBar.appearance().shadowImage = UIImage.init()
        // navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // navigationController?.navigationBar.shadowImage = UIImage()
        
        // scroll view
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        
        // keyboard events
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (Notification) in
            self.buttonSuperview.frame.origin.y = self.buttonOffset
            self.scrollView.contentOffset.y = 100
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (Notification) in
            self.buttonSuperview.frame.origin.y = self.buttonInitialY
            self.scrollView.contentOffset.y = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var t = CGAffineTransform.identity
        t = t.scaledBy(x: 0.2, y: 0.2)
        
        fieldSuperview.transform = t
        fieldSuperview.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.fieldSuperview.transform = CGAffineTransform.identity
            self.fieldSuperview.alpha = 1
        }
    }

    @IBAction func didPressLogin(_ sender: AnyObject) {
        if emailField.hasText && passwordField.hasText {
            activityIndicator.startAnimating()
            
            delay(2.0, closure: { 
                if self.emailField!.text == "mikev@gmail.com" && self.passwordField!.text == "12345" {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.activityIndicator.stopAnimating()
                    
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email and Password", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    
                    alertController.addAction(cancelAction)
                    
                    self.present(alertController, animated: true)
                }
            })
            
        } else {
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        }
    }
    
    @IBAction func didTapOutsideKeyboard(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        if offset >= -50 {
            return
        }
        
        view.endEditing(true)
    }
    
    
}
