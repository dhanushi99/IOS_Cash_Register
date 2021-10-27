//
//  HistoryTableViewController.swift
//  CashRegister
//
//  Created by user202327 on 10/27/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import UIKit
class HistoryTableViewController: UITableViewController {

    var manager : ManagerModel?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (manager?.getHistory().count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = manager?.getHistory()[indexPath.row].itemName
        
        cell.detailTextLabel?.text =  "\( manager?.getHistory()[indexPath.row].itemQuantity ?? 0)"


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let IHVC = segue.destination as? ItemHistoryViewController
        IHVC!.history = manager?.getHistory()[index]
    }
}
