//
//  ManagerViewController.swift
//  CashRegister
//
//  Created by user202327 on 10/27/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import UIKit

class ManagerViewController: UIViewController {

    var manager: ManagerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "tohistory")
        {
            let HTVC = segue.destination as? HistoryTableViewController
            HTVC?.manager = manager
        }
        if(segue.identifier == "torestock")
        {
            let RVC = segue.destination as? RestockViewController
            RVC?.manager = manager
        }
    }
}

