//
//  PhotoDetailViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/24/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checklist["didViewPhoto"] = true
    }

}
