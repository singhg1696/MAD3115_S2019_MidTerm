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
    var count = 0
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtID: UITextField!
    var userList = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func readFromUsers() {
        if let bundelPath = Bundle.main.path(forResource: "Users", ofType: "plist") {
            let dictionary = NSMutableDictionary(contentsOfFile: bundelPath)
            
            userList = (dictionary!["Users"] as! NSDictionary) as! [String : String]
            
        }
    }
    
    private func getRememberMeValues() {
        let userDefault = UserDefaults.standard
        if let email = userDefault.string(forKey: "userEmail") {
            txtID.text = email
            if let pwd = userDefault.string(forKey: "userPassword") {
                txtPassword.text = pwd
            }
        }
    }
    
 

    @IBAction func btnLoginPressed(_ sender: UIBarButtonItem)
    {
        self.checkLogin()
    }
    
    func checkLogin()
    {
        for (k,v) in userList
        {
            if txtID.text == k && txtPassword.text == v
            {
                let userDefault = UserDefaults.standard
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let  userVC = storyBoard.instantiateViewController(withIdentifier: "BillListIdentifier") as! BillListTableViewController
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
                count = count + 1
            }
        }
        if count == 0
        {
            let alert = UIAlertController(title: "Error", message: "Invalid Username or Password", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }

    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        _ = storyboardSegue.source as! BillListTableViewController
        txtPassword.text = ""
        txtID.text = ""
    }
}

