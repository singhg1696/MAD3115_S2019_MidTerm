//
//  Customer.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

class Customer{
    
    let customerId: Int?
    var firstName: String?
    var lastName: String?
    var fullName: String{
        return "\(firstName!) \(lastName!)"
    }
    let email: String?
    var arrayBills: [Bill]?
    var totalBill: Float{
        var Total:Float = 0.0
        for bills in arrayBills! {
            Total = Total + bills.billAmount!
        }
        return Total
    }
    
    init(customerId: Int,firstName: String,lastName: String,email: String,arrayBills: [Bill]) {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.arrayBills = arrayBills
}
}
