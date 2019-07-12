//
//  Bill.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

class Bill{
    
    let billId: Int?
    var billDate: Date?
    var billType: String?
    var billAmount: Float?
    
    init(billId: Int,billDate: Date,billType: String,billAmount: Float) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.billAmount = billAmount
    }
    
    func display() {
        print("----Bill Information----")
        print("********************************")
        print("Bill Id: ",billId!)
        print("Bill Date: ",billDate!)
        print("Bill Type: ",billType!)
        print("Bill Amount: ",billAmount!)
        
        
    }
}
