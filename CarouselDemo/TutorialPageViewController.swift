//
//  TutorialPageViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "page1")
        let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "page2")
        let page3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "page3")
        let page4: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "page4")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([page1], direction: .forward, animated: false, completion: nil)
    }
    
    
    
}

extension TutorialPageViewController: UIPageViewControllerDataSource {
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
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

extension TutorialPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        
        print(pageControl.isHidden)
        
        if pages[2] == previousViewControllers.last && !pageControl.isHidden {
            pageControl.isHidden = true
        } else if pageControl.isHidden {
            pageControl.isHidden = false
        }
    }
}

