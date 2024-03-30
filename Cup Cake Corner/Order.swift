//
//  Order.swift
//  Cup Cake Corner
//
//  Created by Mayank Atri on 27/03/24.
//

import SwiftUI

//MARK: Order Class

@Observable
class Order: Codable {
    
    //MARK: Coding keys
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    //MARK: array of out cupcakes
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainow"]
    
    
    //MARK: varibles for AddressView
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    
    //MARK: validation of address
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        return true
    }
    
    //MARK: varibles for ContentView
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = true
    
    //MARK: Cost for the cupcakes
    
    var cost : Double{
        var cost = Double(quantity) * 2
        cost +=  (Double(type) / 2)
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles{
            cost += Double(quantity) / 2
            
        }
        return cost
        
        
        
    }
}
