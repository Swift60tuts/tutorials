//
//  ViewController.swift
//  Speech60
//
//  Created by Sam Stone on 06/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SFSpeechRecognizer.requestAuthorization {_ in 
            DispatchQueue.main.async {
                switch SFSpeechRecognizer.authorizationStatus() {
                case .authorized:
                    
                    let audioURL = Bundle.main.url(forResource: "test", withExtension: "wav")!
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: audioURL)
                    recognizer?.recognitionTask(with: request) { result, error in
                        guard error == nil else { print("Error: \(error)"); return }
                        guard let result = result else { print("No result!"); return }
                        self.textView.text = result.bestTranscription.formattedString
                    }
                    break
                default:
                    break
                }
            }
        }
    }
}

