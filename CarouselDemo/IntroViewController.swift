//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Michael Volovar on 10/22/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets: [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var xOffsets: [CGFloat] = [-30, 75, -66, 10, -200, -15]
    var scales: [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.contentSize = introImage.frame.size
        scrollView.delegate = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // hide the navigation bar with animation to prevent page jumping / black background
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // set the navigation bar back to visible for the next view
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = Float(scrollView.contentOffset.y)
        
        if offset > 670 {
            return
        }
        
        tile1View.transform = setOffsetPosition(xMin: xOffsets[0], yMin: yOffsets[0], r: rotations[0], s: scales[0], o: offset)
        tile2View.transform = setOffsetPosition(xMin: xOffsets[1], yMin: yOffsets[1], r: rotations[1], s: scales[1], o: offset)
        tile3View.transform = setOffsetPosition(xMin: xOffsets[2], yMin: yOffsets[2], r: rotations[2], s: scales[2], o: offset)
        tile4View.transform = setOffsetPosition(xMin: xOffsets[3], yMin: yOffsets[3], r: rotations[3], s: scales[3], o: offset)
        tile5View.transform = setOffsetPosition(xMin: xOffsets[4], yMin: yOffsets[4], r: rotations[4], s: scales[4], o: offset)
        tile6View.transform = setOffsetPosition(xMin: xOffsets[5], yMin: yOffsets[5], r: rotations[5], s: scales[5], o: offset)
    }
    
    func setOffsetPosition(xMin: CGFloat, yMin: CGFloat, r: CGFloat, s: CGFloat, o: Float) -> CGAffineTransform {
        let offset = CGFloat(o)
        
        let tx = convertValue(inputValue: offset, r1Min: 0, r1Max: 670, r2Min: xMin, r2Max: 0)
        let ty = convertValue(inputValue: offset, r1Min: 0, r1Max: 670, r2Min: yMin, r2Max: 0)
        let tscale = convertValue(inputValue: offset, r1Min: 0, r1Max: 670, r2Min: s, r2Max: 1)
        let trotation = convertValue(inputValue: offset, r1Min: 0, r1Max: 670, r2Min: r, r2Max: 0)
        
        var t = CGAffineTransform.identity
        
        t = t.translatedBy(x: tx, y: ty)
        t = t.scaledBy(x: tscale, y: tscale)
        t = t.rotated(by: trotation * CGFloat(M_PI / 180))
        
        return t
    }
}
