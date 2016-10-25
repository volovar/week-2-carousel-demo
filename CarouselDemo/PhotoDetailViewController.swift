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

    @IBAction func didPressAction(_ sender: AnyObject) {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheetController.addAction(cancelAction)
        
        let shareAction = UIAlertAction(title: "Share", style: .default) { (UIAlertAction) in
            checklist["didSharePhoto"] = true
        }
        
        actionSheetController.addAction(shareAction)
        
        present(actionSheetController, animated: true, completion: nil)
    }
}
