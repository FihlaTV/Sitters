//
//  imageReviewViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/22/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class imageReviewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info [UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
         present(imagePicker, animated: true, completion: nil)
        
    }
   
    @IBAction func nextTapped(_ sender: Any) {
        nextButton.isEnabled = false
        
        let imagesFolder = Storage.storage().reference().child("images")
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil) { (metadata, error) in
            print("we tried to upload!")
            if error != nil {
                print("we had an error:\(String(describing: error))")
                
            }else{
                print(metadata?.downloadURL() ?? 0.1)
                self.performSegue(withIdentifier: "selectuserSegue", sender: metadata!.downloadURL()!.absoluteString)
            }

        }
        
            }

        
        
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SelectUserViewController
        nextVC.imageURL = sender as! String
        nextVC.review = reviewTextField.text!
        
    }
}
