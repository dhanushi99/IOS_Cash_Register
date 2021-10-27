//
//  myCustomTableView.swift
//  CashRegister
//
//  Created by user202327 on 10/27/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import UIKit
class myCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemQty: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


