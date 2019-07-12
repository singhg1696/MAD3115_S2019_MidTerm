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

        let b1: Mobile = Mobile(billId: 1, billDate: Date(), billType: billTypes.Mobile, billAmount: 74, mobileManufacturer: "Samsung S10", planName: "Talk + Data", mobileNo: "+12345678901", netUsed: 23, minuteUsed: 34)
        
        
        let b2: Internet = Internet(billId: 1, billDate: Date(), billType: billTypes.Internet, billAmount: 23.09, providerName: "Bell", internetUsed: 34)
       
        let b3: Hydro = Hydro(billId: 1, billDate: Date(), billType: billTypes.Hydro, billAmount: 765.98, agencyName: "Planet Energy", unitsConsumed: 56)
      
        
        //Creating Customer Objects
        
        let cust1: Customer = Customer(customerId: "1", firstName: "Gurwinder", lastName: "Singh", email: "gurwinder@gmail.com")
        
        cust1.billDictionary[1] = b1
        cust1.billDictionary[2] = b3
        
        let cust2: Customer = Customer(customerId: "2", firstName: "Aman", lastName: "Singh", email: "ujwal@gmail.com")
        
        cust2.billDictionary[1] = b2
        cust2.billDictionary[2] = b1
        cust2.billDictionary[3] = b3
        
        let cust3: Customer = Customer(customerId: "3", firstName: "Ujwal", lastName: "Arora", email: "udhay@gmail.com")
        
        cust3.billDictionary[1] = b2
        
        
        let cust4: Customer = Customer(customerId: "4", firstName: "HArgun", lastName: "MArya", email: "hargun@gmail.com")
        
        cust4.billDictionary[1] = b3
        
        
        let cust5: Customer = Customer(customerId: "5", firstName: "Udhay", lastName: "Singh", email: "aman@gmail.com")
        
        cust5.billDictionary[1] = b3
        
        customerArray = [cust1, cust2, cust3, cust4, cust5]
        
        self.tblViewCustomers.delegate = self
        self.tblViewCustomers.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
 
    func readCustomersPlistFile()
    {
        
        let plist = Bundle.main.path(forResource: "Users", ofType: "plist")
        
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
    
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")  as! CustomerTableCellTableViewCell
        
        cell.textLabel?.text = self.customerArray[indexPath.row].fullName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBtnAction(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func tapBtnAction(_ sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
        Customer.activeCustomer = self.customerArray[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "GoToNextScreen", sender: self)
    }

}


