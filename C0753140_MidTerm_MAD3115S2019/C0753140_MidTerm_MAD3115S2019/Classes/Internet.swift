//
//  Internet.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

class Internet: Bill{
    let providerName: String?
    var internetUsed: Float?
    
    init(billId: Int, billDate: Date, billType: String, billAmount: Float,providerName: String,internetUsed: Float) {
        self.providerName = providerName
        self.internetUsed = internetUsed
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    }
    
   
}
