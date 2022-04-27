//
//  ViewController.swift
//  UIImagePickerVCMemoryLeak
//
//  Created by Arda Dinler on 27.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func openGallery(_ sender: Any) {
        pickImage(fromSource: .photoLibrary)
    }

    func pickImage(fromSource sourceType: UIImagePickerController.SourceType) {

        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else { return }

        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
//            handle image
            print("handle image")
        } else if let image = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage {
//            handle image
            print("handle image2")
        }

        picker.dismiss(animated: true)
    }
}

