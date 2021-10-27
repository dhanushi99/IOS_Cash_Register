//
//  HistoryModel.swift
//  CashRegister
//
//  Created by user202327 on 10/25/21.
//  Copyright © 2021 user202327. All rights reserved.
//
import Foundation
class HistoryModel
{
    var itemName : String
    var itemQuantity : Int
    var totalPrice: Double
    var pcDate: String
    
    init(name : String, quantity: Int, total: Double, date: String)
    {
        itemName = name
        itemQuantity = quantity
        totalPrice = total
        pcDate = date
    }
}

