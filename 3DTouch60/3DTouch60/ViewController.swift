//
//  ViewController.swift
//  3DTouch60
//
//  Created by Sam Stone on 05/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func updateForTouches(touches: Set<UITouch>?) {
        guard traitCollection.forceTouchCapability == .available else { return }
        
        var force: Float = 0.0
        
        if let touches = touches, let touch = touches.first {
            force = Float(touch.force / touch.maximumPossibleForce)
        }
        
        view.backgroundColor = UIColor.red.withAlphaComponent(CGFloat(force))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        updateForTouches(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        updateForTouches(touches: touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        updateForTouches(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        updateForTouches(touches: touches)
    }

}

