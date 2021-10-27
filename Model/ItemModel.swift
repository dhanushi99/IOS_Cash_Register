//
//  ItemModel.swift
//  CashRegister
//
//  Created by user202327 on 10/25/21.
//  Copyright © 2021 user202327. All rights reserved.
//

import Foundation
class ItemModel{
var itemName : String
var itemQuantity : Int
var itemPrice: Float

init(name : String, quantity: Int, price: Float)
{
    itemName = name
    itemQuantity = quantity
    itemPrice = price
}
}
