//
//  FeedViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImage.frame.size
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "feed_view_title_image"))
        
        // for future ref: add this to the view that the next view will return to
        // eg: I was adding this to the conversations view and it wasn't doing anything...
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
