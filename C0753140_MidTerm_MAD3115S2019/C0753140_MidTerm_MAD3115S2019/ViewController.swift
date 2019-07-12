//
//  ViewController.swift
//  C0753140_MidTerm_MAD3115S2019
//
//  Created by Gurwinder on 2019-07-11.
//  Copyright © 2019 Gurwinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        getRememberMeValues()
        // Do any additional setup after loading the view.
    }
    
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtID.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
        }
    }

    @IBAction func btnLoginPressed(_ sender: UIBarButtonItem)
    {
        
        if let plist = Bundle.main.path(forResource: "Users", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let users = dict["Users"] as? [[String:Any]]
                {
                    for user in users
                    {
                        if ( (self.txtID.text == (user["email"] as! String)) && (self.txtPassword.text == (user["password"] as! String)) )
                        {
                            let userDefault = UserDefaults.standard
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let  userVC = sb.instantiateViewController(withIdentifier: "BillListVC") as! BillListTableViewController
                            //             userVC.eMailId = txtTextField.text
                            self.present(userVC, animated: true, completion: nil)
                            if switchRememberMe.isOn
                            {
                                
                                userDefault.setValue(txtID.text, forKey: "userEmail")
                                userDefault.set(txtPassword.text, forKey: "userPassword")
                            }
                            else
                            {
                                userDefault.removeObject(forKey: "userEmail")
                                userDefault.removeObject(forKey: "userPassword")
                            }
                        }
                        else
                        {
                            let alert = UIAlertController(title: "Error", message: "Invalid UserId or Password", preferredStyle: .alert)
                            
                            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            
                            alert.addAction(okButton)
                            
                            self.present(alert, animated: true)
                        }
                    }
                }
            }
        }
    }

    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        _ = storyboardSegue.source as! BillListTableViewController
        
        if switchRememberMe.isOn{
            
        }
        else{
            txtPassword.text = ""
             txtID.text = ""
        }
    
    }
    
//    func readInformationPlist() {
//        if let bundlePath = Bundle.main.path(forResource: "Employee", ofType: "plist") {
//            _ = NSMutableDictionary(contentsOfFile: bundlePath)
//
//            //print(dictionary!.description)
//
//
//        }
//
//
//    }
    
    
   
}

