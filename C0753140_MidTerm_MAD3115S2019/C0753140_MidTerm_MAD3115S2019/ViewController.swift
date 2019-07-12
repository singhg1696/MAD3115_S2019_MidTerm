//
//  ViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtID: UITextField!
    var UsersDict = [UsersStruct]()
    
    // getting user defaults reference
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginPressed(_ sender: UIBarButtonItem)
    {
        self.checkLogin()
    }
    
    func checkLogin()
    {
        if let email = txtID.text{
            if !email.isEmpty{
                
                if email.isValidEmail(){
                    if let password = txtPassword.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                                if  checkEmailPassword(email: email, password: password) {
                                    setRememberMe()
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let dashboardVC = storyboard.instantiateViewController(withIdentifier: "customerListVC") as! BillListTableViewController
                                    
                                    self.navigationController?.pushViewController(dashboardVC, animated: true)
                                    
                                    
                                }else{
                                    showAlerBox(msg: "You have enter wrong credentials")
                                }
                                
                            }else{
                                showAlerBox(msg: "Invalid password size")
                            }
                            
                        }else{
                            showAlerBox(msg: "Please enter password")
                        }
                    }
                }
                else{
                    showAlerBox(msg: "Please enter valid email")
                }
            }else{
                showAlerBox(msg: "Please enter useremail")
            }
        }
    }
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let Customers = dict["Users"] as? [[String:Any]]
            {
                for customer in Customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.UsersDict.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
        
    }
    
    func checkEmailPassword(email : String , password : String) -> Bool{
        
        for everyCustomer in UsersDict{
            if (everyCustomer.email == email && everyCustomer.password == password) {
                return true
            }
        }
        return false
    }
    
    func setRememberMe()  {
        if switchRememberMe.isOn {
            userDefault.set(self.txtID.text, forKey: "email")
            userDefault.set(self.txtPassword.text, forKey: "password")
        }else{
            userDefault.set("", forKey: "email")
            userDefault.set("", forKey: "password")
        }
    }
    
    func getRememberMe()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "email")
        {
            txtID.text = email
            
            if let password = userDefault.string(forKey: "password")
            {
                txtPassword.text = password
                switchRememberMe.setOn(true, animated: false)
            }
        }
    }
    
    
    func showAlerBox(msg : String)  {
        let alertController = UIAlertController(title: "CustomerBillApp", message:
            msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        _ = storyboardSegue.source as! BillListTableViewController
        txtPassword.text = ""
        txtID.text = ""
    }
}

