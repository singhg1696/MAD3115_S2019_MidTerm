//
//  BillListTableViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class BillListTableViewController: UIViewController {

    var customers = [Customer]()
    
    @IBOutlet weak var tblViewCustomers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViewCustomers.delegate = self
        self.tblViewCustomers.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension BillListTableViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.customers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! StudentTableViewCell
        let customer = self.customers[indexPath.row]
        
        cell.
        cell.lblStudentId.text = "Student ID : \(stud.studentId)"
        cell.lblStudentName.text = "Name : \(stud.studentName)"
        cell.lblCity.text = "City : \(stud.city)"
        
        return cell
    }


}

