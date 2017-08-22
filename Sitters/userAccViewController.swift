//
//  userAccViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/22/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class userAccViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }
}
