//
//  Hydro.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation
class Hydro: Bill{
    let agencyName: String?
    var unitsConsumed: Float?
    
    init(billId: Int, billDate: Date, billType: String, billAmount: Float,agencyName: String,unitsConsumed: Float) {
        self.agencyName = agencyName
        self.unitsConsumed = unitsConsumed
        super.init(Id: billId, billDate: billDate, billType: billType, totalBillAmount: billAmount)
    }
    
   
}
