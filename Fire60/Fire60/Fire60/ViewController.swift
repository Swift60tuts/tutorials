//
//  ViewController.swift
//  Fire60
//
//  Created by Sam Stone on 04/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var landscape: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addParallaxToView(vw: self.landscape)
    }
    
    func addParallaxToView(vw: UIView) {
        let amount = 50
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }



}

