//
//  TutorialViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TutorialViewController: UIPageViewController {
    @IBOutlet weak var buttonSuperview: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        buttonInitialY = buttonSuperview.frame.origin.y
//        buttonOffset = buttonInitialY - buttonSuperview.frame.height
        
//        print("!!! the offset is ", buttonOffset)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    
}
