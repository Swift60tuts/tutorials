//
//  ViewController.swift
//  SolarSystem60
//
//  Created by Sam Stone on 09/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY), radius: 120, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position");
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        let moon = UIImageView()
        moon.frame = CGRect(x:0, y:0, width:40, height:40);
        moon.image = UIImage(named: "moon.png")
        view.addSubview(moon)
        moon.layer.add(animation, forKey: nil)
    }



}

