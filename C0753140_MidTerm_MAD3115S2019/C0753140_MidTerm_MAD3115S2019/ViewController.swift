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
        self.readInformationPlist()
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

    @IBAction func btnLoginPressed(_ sender: UIBarButtonItem) {
        
        if self.txtID.text == "admin@gmail.com" && self.txtPassword.text == "s3cr3t"
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
            let alert = UIAlertController(title: "Error", message: "Try again, User Email / Password Invalid", preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okButton)
            
            self.present(alert, animated: true)
        }
    }
    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        let s = storyboardSegue.source as! BillListTableViewController
        
        txtPassword.text = ""
        txtID.text = ""
    }
    
    
    func readInformationPlist() {
        if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "plist") {
            let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
            
        }
    }
}

