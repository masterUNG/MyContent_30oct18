//
//  ViewController.swift
//  MyContent
//
//  Created by MasterUNG on 30/10/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    Explicit
    var userString: String?
    var passwordString: String?
    
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signInButton(_ sender: Any) {
        
        userString = userTextField.text
        passwordString = passwordTextField.text
        showLog()
        
    }   // signIn
    
    func showLog() -> Void {
        print("user ==> \(userString!)")
        print("password ==> \(passwordString!)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

