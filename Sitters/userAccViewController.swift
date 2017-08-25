//
//  userAccViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/22/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class userAccViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var descpri: [Review] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("descpri").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            let desc = Review()
            let value = snapshot.value as? NSDictionary
            desc.imageURL = value?["imageURL"] as? String ?? ""
            desc.from = value!["from"] as! String
            desc.rev = value!["customerreview"] as! String
            
            self.descpri.append(desc)
            
            self.tableView.reloadData()
            
        })

                   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descpri.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let review = descpri[indexPath.row]
        cell.textLabel?.text = review.from
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         let review = descpri[indexPath.row]
        performSegue(withIdentifier: "viewimgsegue", sender: review)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewimgsegue" {
        let nextVC = segue.destination as! ViewImageViewController
        nextVC.review = sender as! Review
    }
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   }
