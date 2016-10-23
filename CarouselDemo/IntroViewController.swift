//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.contentSize = introImage.frame.size
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
