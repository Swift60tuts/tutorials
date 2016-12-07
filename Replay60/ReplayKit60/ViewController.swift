//
//  ViewController.swift
//  ReplayKit60
//
//  Created by Sam Stone on 07/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    @IBAction func record(_ sender: Any) {
        let recorder = RPScreenRecorder.shared()
        recorder.startRecording(handler: nil)
    }

    @IBAction func stop(_ sender: Any) {
        let recorder = RPScreenRecorder.shared()
        
        recorder.stopRecording { (previewVC, error) in
            if let vc = previewVC {
                self.present(
                    vc,
                    animated: true,
                    completion: nil
                )
            }
        }
    }
    
}

