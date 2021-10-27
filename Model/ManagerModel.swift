//
//  ManagerModel.swift
//  CashRegister
//
//  Created by user202327 on 10/25/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import Foundation
class ManagerModel{
    var item = [ItemModel]()
    var history = [HistoryModel]()
    
    func addItem(newItem :ItemModel)
    {
        item.append(newItem)
    }
    func getItems()->[ItemModel]
    {
        return item
    }
    
    func addHistory(newhistory :HistoryModel)
    {
        history.append(newhistory)
    }
    
    func getHistory()->[HistoryModel]
    {
        return history
    }
}



