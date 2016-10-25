//
//  BannerViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/24/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

var checklist: [String: Bool] = ["didViewPhoto": false, "didSwipePhoto": false, "didSharePhoto": false, "didDismiss": false]

class BannerViewController: UIViewController {
    @IBOutlet weak var checkbox1: UIButton!
    @IBOutlet weak var checkbox2: UIButton!
    @IBOutlet weak var checkbox3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if checklist["didViewPhoto"] == true {
            checkbox1.isSelected = true
        }
    }
    
    @IBAction func didPressClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
