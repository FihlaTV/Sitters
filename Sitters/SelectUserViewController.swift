//
//  SelectUserViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/24/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{


    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    var imageURL = ""
    var review = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.tableView.delegate = self
        self.tableView.dataSource = self
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            let user = User()
            let value = snapshot.value as? NSDictionary
            user.email = value?["email"] as? String ?? ""
            user.uid = snapshot.key
            self.users.append(user)
            self.tableView.reloadData()
        })

    }
    
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email
        return cell
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let user = users[indexPath.row]
        let snap = ["from":user.email, "descripton":review, "imageURL":imageURL]
        
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        navigationController!.popToRootViewController(animated: true)
        
    }
    
}
