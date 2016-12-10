//
//  ViewController.swift
//  Fire60
//
//  Created by Sam Stone on 07/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createFire()
    }
    
    func createFire() {
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: 200, y: 500)
        fireEmitter.emitterSize = CGSize(width: 150, height: 10);
        fireEmitter.renderMode = kCAEmitterLayerAdditive;
        fireEmitter.emitterShape = kCAEmitterLayerLine
        fireEmitter.emitterCells = [createFireCell()];
        
        self.view.layer.addSublayer(fireEmitter)
    }
    
    func createFireCell() -> CAEmitterCell {
        let fire = CAEmitterCell();
        fire.alphaSpeed = -0.3
        fire.birthRate = 600;
        fire.lifetime = 60.0;
        fire.lifetimeRange = 0.5
        fire.color = UIColor.init(colorLiteralRed: 0.8, green: 0.4, blue: 0.2, alpha: 0.6).cgColor
        fire.contents = UIImage(named: "fire")?.cgImage
        fire.emissionLongitude = CGFloat(M_PI);
        fire.velocity = 80;
        fire.velocityRange = 5;
        fire.emissionRange = 0.5;
        fire.yAcceleration = -200;
        fire.scaleSpeed = 0.3;
        
        return fire
    }


}

