//
//  ClientViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    @IBOutlet weak var clientTableView: UITableView!
    var clientIds = [String]() {
        didSet {
            
        }
    }
    
    
   override func viewDidLoad() {
        super.viewDidLoad()

    }

}
