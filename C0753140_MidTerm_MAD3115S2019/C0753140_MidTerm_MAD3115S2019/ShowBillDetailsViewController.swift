//
//  ShowBillDetailsViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-12.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    @IBOutlet weak var lblTotalBill: UILabel!
    @IBOutlet weak var lblCustomerEmail: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblCustomerId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tbl_billdetails.delegate = self
        self.tbl_billdetails.dataSource = self
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

extension ShowBillDetailsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Customer.activeCustomer.billDictionary.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idBill")  as! UITableViewCell
        
        let currentbill = Customer.activeCustomer.billDictionary[indexPath.row + 1]
        var furtherDetails = ""
    }
    
    
}
