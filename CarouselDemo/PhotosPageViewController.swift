//
//  PhotosPageViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/24/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class PhotosPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "photoDetail1")
        let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "photoDetail2")
        
        pages.append(page1)
        pages.append(page2)
        
        setViewControllers([page1], direction: .forward, animated: false, completion: nil)
    }
    
}

extension PhotosPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.index(of: viewController)!
        
        guard currentIndex > 0 else {
            return nil
        }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        
        guard currentIndex < pages.count - 1 else {
            return nil
        }
        
        return pages[currentIndex + 1]
    }
}
