//
//  Menu.swift
//  IOS_Final_Project
//
//  Created by Arpita Sharma on 24/08/20.
//  Copyright © 2020 user168953. All rights reserved.
//

import Foundation

class Menu
{

    var item_name: String
    var item_description: String
    var price: Float
    
    
    init(item_name: String, price: Float, item_description: String) {
        self.item_name = item_name
        self.price = price
        self.item_description = item_description
    }
    
    func getItemName() -> String
    {
        return self.item_name
    }
    
    
    internal func getItemDescription() -> String
    {
        return self.item_description
    }
    
    
    internal func getPrice() -> Float
    {
        return self.price
    }
    
}
