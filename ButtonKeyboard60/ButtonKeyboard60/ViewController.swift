//
//  ViewController.swift
//  ButtonKeyboard60
//
//  Created by Swift60 on 03/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotifications()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(notification:)), name:NSNotification.Name.UIKeyboardWillChangeFrame, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    func keyboardWillChangeFrame(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue,
            let animationOptions = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue {
            UIView.animate(withDuration: TimeInterval(animationDuration), delay: 0, options: UIViewAnimationOptions(rawValue: animationOptions), animations: {
                self.buttonBottomConstraint.constant = keyboardSize.height
            }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue,
            let animationOptions = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue {
            UIView.animate(withDuration: TimeInterval(animationDuration), delay: 0, options: UIViewAnimationOptions(rawValue: animationOptions), animations: {
                self.buttonBottomConstraint.constant = 0
            }, completion: nil)
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }


}

