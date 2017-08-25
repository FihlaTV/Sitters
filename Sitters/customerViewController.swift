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

    @IBOutlet weak var tableView: UITableView!
    var reviews: [Review] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("reviews").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            let review = Review()
            let value = snapshot.value as? NSDictionary
            review.imageURL = value? ["imageURL"] as? String ?? ""
            review.from = value! ["from"] as! String
            review.rev = value! ["customerreview"] as! String
            
            self.reviews.append(review)
            self.tableView.reloadData()
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let review = reviews[indexPath.row]
        cell.textLabel!.text = review.from
        return cell
        
    }
    
   
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
