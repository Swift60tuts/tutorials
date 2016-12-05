//
//  ViewController.swift
//  ImagePicker60
//
//  Created by Sam Stone on 04/12/2016.
//  Copyright © 2016 Sam Stone. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func imagePickerPressed(_ sender: Any) {
        let types = UIImagePickerController.availableMediaTypes(for: .camera)!
        let canTakePhotos = types.contains(kUTTypeImage as String)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) && canTakePhotos {
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.mediaTypes = [kUTTypeImage as String]
            ipc.allowsEditing = true
            ipc.delegate = self
            present(ipc, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let croppedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        self.imageView.image = croppedImage
        picker.dismiss(animated: true, completion: nil)
    }

}

