//
//  Customer.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

// Use structure only to read data
struct CustomersStruct {
    let customerID : Int
    var customerFName : String
    var customerLName : String
    var email : String
    var password : String
    
    var fullName : String{
        return "\(customerFName ) \(customerLName)"
    }
    
}
