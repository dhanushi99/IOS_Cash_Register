//
//  ItemHistoryViewController.swift
//  CashRegister
//
//  Created by user202327 on 10/27/21.
//  Copyright © 2021 user202327. All rights reserved.
//

import UIKit

class ItemHistoryViewController: UIViewController {
    
    @IBOutlet weak var ItemName: UILabel!
    
    @IBOutlet weak var ItemQty: UILabel!
    
    @IBOutlet weak var TotalPrice: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    
    var history : HistoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ItemName.text = history?.itemName
        ItemQty.text = String(history!.itemQuantity)
        TotalPrice.text = "Total Amount: " + String(history!.totalPrice)
        Date.text = history?.pcDate
        self.title = history?.itemName
    }

}

