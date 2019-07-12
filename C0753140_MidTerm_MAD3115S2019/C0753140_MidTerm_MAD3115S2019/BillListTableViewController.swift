//
//  BillListTableViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class BillListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{


    var customerList = [UsersStruct]()
    var customerArray = Array<Customer>()
    @IBOutlet weak var tblViewCustomers: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let b1: Mobile = Mobile(billId: 1, billDate: Date(), billType: billTypes.Mobile, billAmount: 74.52, mobileManufacturer: "Samsung S10", planName: "Talk + Data", mobileNo: "+12345678901", netUsed: 23, minuteUsed: 34)
        let b2: Mobile = Mobile(billId: 2, billDate: Date(), billType: billTypes.Mobile, billAmount: 34.98, mobileManufacturer: "LG", planName: "LTE+3G 9.5GB Promo plan", mobileNo: "+14567431985", netUsed: 67, minuteUsed: 456)
        
        let b3: Internet = Internet(billId: 1, billDate: Date(), billType: billTypes.Internet, billAmount: 23.09, providerName: "Bell", internetUsed: 34)
        let b4: Internet = Internet(billId: 2, billDate: Date(), billType: billTypes.Internet, billAmount: 236.09, providerName: "Rogers", internetUsed: 765)
        
        let b5: Hydro = Hydro(billId: 1, billDate: Date(), billType: billTypes.Hydro, billAmount: 765.98, agencyName: "Planet Energy", unitsConsumed: 56)
        let b6: Hydro = Hydro(billId: 2, billDate: Date(), billType: billTypes.Hydro, billAmount: 476.8, agencyName: "Energizer", unitsConsumed: 98)
        
        //Creating Customer Objects
        
        let cust1: Customer = Customer(customerId: "1", firstName: "Naina", lastName: "Vaghasiya", email: "naina@gmail.com")
        
        cust1.billDictionary[1] = b1
        cust1.billDictionary[2] = b3
        
        let cust2: Customer = Customer(customerId: "2", firstName: "Karan", lastName: "Kundan", email: "Karan@gmail.com")
        
        cust2.billDictionary[1] = b2
        cust2.billDictionary[2] = b6
        cust2.billDictionary[3] = b5
        
        let cust3: Customer = Customer(customerId: "3", firstName: "Vipul", lastName: "Garg", email: "vipul.garg@gmail.com")
        
        cust3.billDictionary[1] = b4
        
        
        let cust4: Customer = Customer(customerId: "4", firstName: "Shivani", lastName: "Dhiman", email: "Shivani18@gmail.com")
        
        cust4.billDictionary[1] = b3
        
        
        let cust5: Customer = Customer(customerId: "5", firstName: "Jazz", lastName: "Patel", email: "Jazz123@gmail.com")
        
        cust5.billDictionary[1] = b6
        
        customerArray = [cust1, cust2, cust3, cust4, cust5]
        
        self.tblViewCustomers.delegate = self
        self.tblViewCustomers.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
 
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["Users"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! CustomerTableCellTableViewCell
        let customerData = self.customerList[indexPath.row]
        cell.lblCustomerName.text = "Customer ID : \(customerData.fullName)"
        
        return cell
    }

}


