//
//  SignInViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/20/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var passWordTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SignInUpTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passWordTextfield.text!) { (user, error) in
            // ...
            print("we tried to sign in")
            if error != nil {
                print("Hey we have an error:\(String(describing: error))")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passWordTextfield.text!, completion: { (user, error) in
                 print("we tried to create a user")
                    if error != nil {
                        print("Hey we have an error:\(String(describing: error))")
                    } else {
                        print("Created user Successfully")
                        self.performSegue(withIdentifier: "SigninSegue", sender: nil)
                    }
                })
            } else {
                print("Signed in Successfully")
                self.performSegue(withIdentifier: "SigninSegue", sender: nil)
            }
        }
        
    }
    
}

