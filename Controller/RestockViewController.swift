//
//  RestockViewController.swift
//  CashRegister
//
//  Created by user202327 on 10/27/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var editText: UITextField!
    
    @IBOutlet weak var itemTable: UITableView!
    
    var manager : ManagerModel?
    var index = 0
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager!.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = (manager?.getItems()[indexPath.row].itemName)

        cell.detailTextLabel?.text = String((manager?.getItems()[indexPath.row].itemQuantity)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        flag = 1;
        index = indexPath.row
    }
    @IBAction func RestockClicked(_ sender: Any) {
        if flag == 1 {
            if editText.text != "" {
                if let _ = Int(editText.text!)
                {
                    manager?.getItems()[index].itemQuantity = Int(editText.text!)!
                    itemTable.reloadData()
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Please Enter only numbers in the Quantity", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                }
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Please Enter Quantity to Restock", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
           
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Please Select an Item before Restocking", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func CancelClicked(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
}
