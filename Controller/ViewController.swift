//
//  ViewController.swift
//  CashRegister
//
//  Created by user202327 on 10/11/21.
//  Copyright © 2021 user202327. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,
                      UITableViewDelegate,
                      UITableViewDataSource{
    
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var manager: ManagerModel = ManagerModel()
    var itemName:[String] = ["Pants","Shoes","Hats","Tshirts","Dresses"]
    var itemQuantity: [Int] = [20,50,10,10,24]
    var itemPrice: [Float] = [50.9,90,20.5,21.75,69.53]
    
    var index = 0
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<itemName.count
        {
            manager.addItem(newItem: ItemModel(name: itemName[i], quantity: itemQuantity[i], price: itemPrice[i]))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.getItems().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! myCustomTableViewCell
        
        cell.itemName.text = manager.getItems()[indexPath.row].itemName

        cell.itemQty.text = String(manager.getItems()[indexPath.row].itemQuantity)

        cell.itemPrice.text = String(manager.getItems()[indexPath.row].itemPrice)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
        let name = manager.getItems()[indexPath.row].itemName
        type.text? =  name
        quantity.text = ""
        total.text = ""
    }
    
    
    @IBAction func btnNumberPressed(_ sender: UIButton) {
        
        var qty:Float;
        var ttlPrice : Float;
        
        let unitPrice = manager.getItems()[index].itemPrice
        counter += 1
        let number = sender.titleLabel?.text
        if(counter == 1)
        {
            quantity.text = number!
        }
        else
        {
            quantity.text?.append(number!)
        }
            
        qty = Float(quantity.text!)!
        ttlPrice = qty * unitPrice
        total.text = String(ttlPrice)
        
    }

    
    @IBAction func btnBuyPressed(_ sender: UIButton)
    {
        let qtyEntered = Int(quantity.text!)!
        let QtyLeft = manager.getItems()[index].itemQuantity
        
        if qtyEntered > QtyLeft {
            let alert = UIAlertController(title: "Error", message: "Item out of stock", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
            quantity.text = "Quantity"
            total.text = "Total"
            type.text = "Type"
            counter = 0
        }
        else
        {
            manager.getItems()[index].itemQuantity = QtyLeft - qtyEntered
            
            let date = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyyy, HH:mm:ss"
            manager.addHistory(newhistory: HistoryModel(name: type.text!, quantity: qtyEntered,total: Double(total.text!)!,date: dateformatter.string(for: date)!))
            
            
            quantity.text = "Quantity"
            total.text = "Total"
            type.text = "Type"
            counter = 0
        }
        
        tableView.reloadData()    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? ManagerViewController
        MVC!.manager = manager
    }
    
}

