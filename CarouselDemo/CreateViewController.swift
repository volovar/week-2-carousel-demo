//
//  CreateViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/24/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var buttonSuperview: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = UIScreen.main.bounds
        
        buttonInitialY = buttonSuperview.frame.origin.y
        buttonOffset = buttonInitialY - 120

        scrollView.delegate = self
        scrollView.contentSize = bounds.size
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        if offset >= -50 {
            return
        }
        
        view.endEditing(true)
    }

    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didPressCheckbox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
