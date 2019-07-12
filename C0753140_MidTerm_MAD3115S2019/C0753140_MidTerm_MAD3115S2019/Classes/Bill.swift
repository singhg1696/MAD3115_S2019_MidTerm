//
//  Bill.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

enum billTypes {
    case Mobile, Internet, Hydro, None
}

class Bill
{
    var Id: Int
    var billDate: Date
    var billType: billTypes
    var totalBillAmount: Float
    
    init()
    {
        self.Id = Int()
        self.billDate = Date()
        self.billType = billTypes.None
        self.totalBillAmount = Float()
    }
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float)
    {
        self.Id = Id
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = totalBillAmount
    }
}
