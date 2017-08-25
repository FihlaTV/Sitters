//
//  ViewImageViewController.swift
//  Sitters
//
//  Created by ADENIKE TOMOMEWO on 8/24/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class ViewImageViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    var review = Review()
    override func viewDidLoad() {
        super.viewDidLoad()

       label.text = review.rev
    }

   
}
