//
//  TutorialLastViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TutorialLastViewController: UIViewController {
    @IBOutlet weak var buttonSuperview: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonSuperview.frame.origin.y
        buttonOffset = buttonInitialY - (buttonSuperview.frame.height * 1.5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.buttonSuperview.frame.origin.y = self.buttonOffset
        }
    }

}
