//
//  customerViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/21/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class customerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var imgBackground: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    var reviews: [Review] = []
    let pets = ["dogWalker", "dog"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        imgBackground.image = UIImage(named: "dog.jpeg")
        
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
  let cell = UITableViewCell()
        return cell
        

        
    }
    
   
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
