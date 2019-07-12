//
//  ShowBillDetailsViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-12.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    @IBOutlet weak var tblBillDetails: UITableView!
    @IBOutlet weak var lblTotalBill: UILabel!
    @IBOutlet weak var lblCustomerEmail: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblCustomerId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tblBillDetails.delegate = self
//        self.tblBillDetails.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lblCustomerId.text = Customer.activeCustomer.customerId
        self.lblCustomerEmail.text = Customer.activeCustomer.email
        self.lblCustomerName.text = Customer.activeCustomer.fullName
        self.lblTotalBill.text = String(Customer.activeCustomer.TotalAmountToPay)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension ShowBillDetailsViewController: UITableViewDataSource, UITableViewDelegate
//{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Customer.activeCustomer.billDictionary.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "billDetailsCell")  as! billDetailsTableViewCell
//
//        let currentbill = Customer.activeCustomer.billDictionary[indexPath.row + 1]
//        var furtherDetails = ""
//        if currentbill?.billType == billTypes.Mobile{
//            cell.textLabel?.numberOfLines = 12
//            let mobileBill = currentbill as! Mobile
//            furtherDetails = "\nManufacturer Name : \(String(describing: mobileBill.mobileManufacturer)) \nPlan Name : \(String(describing: mobileBill.planName)) \nMobile Number : \(mobileBill.mobileNo) \nInternet used : \(String(describing: mobileBill.netUsed)) \nMinutes Used : \(String(describing: mobileBill.minuteUsed)) "
//        } else {
//            if currentbill?.billType == billTypes.Hydro{
//                cell.textLabel?.numberOfLines = 12
//                let hydroBill = currentbill as! Hydro
//                furtherDetails = "Agency Name : \(String(describing: hydroBill.agencyName)) \n Unit Consumed : \(String(describing: hydroBill.unitsConsumed))"
//            } else {
//                if currentbill?.billType == billTypes.Internet{
//                    cell.textLabel?.numberOfLines = 12
//                    let internetBill = currentbill as! Internet
//                    furtherDetails = "Provider Name : \(internetBill.providerName) \nInternet Used : \(String(describing: internetBill.internetUsed))"
//                }
//            }
//        }
//        cell.textLabel?.text = "Bill ID : \(String(describing: currentbill!.Id)) \nBill Date : \(String(describing: currentbill!.billDate)) \nBill Type : \(String(describing: currentbill!.billType)) \nBill Total : \(String(describing: currentbill!.totalBillAmount)) \(furtherDetails)"
//        return cell
//    }
//
//
//}
