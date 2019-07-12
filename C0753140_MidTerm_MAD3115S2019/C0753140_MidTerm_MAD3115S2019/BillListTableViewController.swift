//
//  BillListTableViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class BillListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var customers = [CustomersStruct]()
    
    @IBOutlet weak var tblViewCustomers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViewCustomers.delegate = self
        self.tblViewCustomers.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! CustomerTableCellTableViewCell
        let customerData = self.customers[indexPath.row]
        cell.lblCustomerName.text = "Customer ID : \(customerData.fullName)"
        
        return cell
    }

}


