//
//  RegisterViewController.swift
//  MyContent
//
//  Created by MasterUNG on 30/10/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //    Explicit
    var nameString: String = ""
    var userString: String = ""
    var passwordString: String = ""
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func uploadButton(_ sender: Any) {
        
        nameString = nameTextField.text!
        userString = userTextField.text!
        passwordString = passwordTextField.text!
        showLogString()
        
        if checkString() {
//            Have Space
            
        } else {
//            No Space
            
        }
        
        
        
    }   // upload
    
    func checkString() -> Bool {
        
        var result: Bool?
        
        if (nameString.count == 0) || (userString.count == 0) || (passwordString.count == 0) {
            result = true
        } else {
            result = false
        }
        
        print("checkString ==> \(result!)")
        return result!
    }
    
    func showLogString() -> Void {
        print("name ==> \(nameString)")
        print("user ==> \(userString)")
        print("password ==> \(passwordString)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }   // viewDidLoad
    
}   // Main Class
