//
//  Mobile.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import Foundation

class Mobile: Bill{
    let mobileManufacturer: String?
    var planName: String?
    var mobileNo: Int64?
    var netUsed: Float?
    var minuteUsed: Float?
    
    init(billId: Int, billDate: Date, billType: String, billAmount: Float,mobileManufacturer: String,planName: String,mobileNo: Int64,netUsed: Float,minuteUsed: Float) {
        self.mobileManufacturer = mobileManufacturer
        self.planName = planName
        self.mobileNo = mobileNo
        self.minuteUsed = minuteUsed
        self.netUsed = netUsed
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    }
    
    
}
