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
    var urlAddDataString: String = "https://www.androidthai.in.th/kob/addDataMaster.php?isAdd=true&"
    
    
    
    
    
    
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
            myAlertDialog(title: "Have Space", myMessage: "Please Fill All Blank")
        } else {
            //            No Space
            urlAddDataString = urlAddDataString + "Name=" + nameString + "&User=" + userString + "&Password=" + passwordString
            print("urlAddData ==> \(urlAddDataString)")
            uploadDataToServer()
            
        }   // if
        
        
        
    }   // upload
    
    

    func uploadDataToServer() -> Void {
    
        let urlPHP = URL(string: urlAddDataString)
        let request = NSMutableURLRequest(url: urlPHP!)
        moveToMain()
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if error != nil {
                print("Cannot Connected Server")
            } else {
                
                if let readData = data {
                    
                    let canReadData = NSString(data: readData, encoding: String.Encoding.utf8.rawValue)
                    let resultString: String = canReadData! as String
                    print("resultString ==> \(resultString)")
                    
                }   // if2
                
            } // if
            
        }   // end task
        task.resume()
        
        
        
    }   // upload
    
    func moveToMain() -> Void {
        performSegue(withIdentifier: "back_segue", sender: self)
    }
    
    
    
    func myAlertDialog(title: String, myMessage: String) -> Void {
        
        let alert = UIAlertController(title: title, message: myMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
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
