//
//  SettingsViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsScrollView.contentSize = settingsImage.frame.size
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "settings_view_title_image"))
    }

    @IBAction func didPressClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressSignOut(_ sender: AnyObject) {
        let actionController = UIAlertController(title: "", message: "Are you sure you want to Sign Out?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionController.addAction(cancelAction)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (UIAlertAction) in
            print("pressed sign out")
            self.performSegue(withIdentifier: "signOutSegue", sender: sender)
        }
        
        actionController.addAction(signOutAction)
        
        present(actionController, animated: true, completion: nil)
    }
}
