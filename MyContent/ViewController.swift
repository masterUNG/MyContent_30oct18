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
        
        if checkData() {
//            Have Space
            showAlert(myTitle: "Have Space", myMessage: "Please Fill Every Blank")
        } else {
//            No Space
            
        }
        
    }   // signIn
    
    func showAlert(myTitle: String, myMessage: String) -> Void {
        
        let myAlert = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertController.Style.alert)
        
        myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            myAlert.dismiss(animated: true, completion: nil)
            print("You Click OK")
        }))
        
        myAlert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: { (action) in
            myAlert.dismiss(animated: true, completion: nil)
            print("You Click NO")
        }))
        
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    func checkData() -> Bool {
        var resultBool: Bool = false
        if (userString?.count == 0) || (passwordString?.count == 0) {
            resultBool = true
        }
        print("resultBool ==> \(resultBool)")
        return resultBool
    }
    
    func showLog() -> Void {
        print("user ==> \(userString!)")
        print("password ==> \(passwordString!)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

