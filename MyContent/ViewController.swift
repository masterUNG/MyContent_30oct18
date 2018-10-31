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
    var urlString: String = "https://www.androidthai.in.th/kob/authenMaster.php?isAdd=true&User="
    
    
    
    
    
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
            checkAuthen()
        }
        
    }   // signIn
    
    func checkAuthen() -> Void {
        
        let myUrlString: String = urlString + userString!
        print("urlString ==> \(myUrlString)")
        
        let urlPHP = URL(string: myUrlString)
        let request = NSMutableURLRequest(url: urlPHP!)
        
//        Create Task or Thread
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if error != nil {
                print("Have Error")
            } else {
                
                if let myReadData = data {
                    
                    let canReadData = NSString(data: myReadData, encoding: String.Encoding.utf8.rawValue)
                    
                    let jsonString: String = canReadData! as String
                    print("jsonString ==> \(jsonString)")
                    
//                    Check User
                    if jsonString == "null" {
//                        self.showAlert(myTitle: "User False", myMessage: "No " + self.userString! + " in my Database")
                        
                        
                        self.test(testString: jsonString)
                        print("User False")
                        
                    } else {
                        
                        let blockPrefix = "["
                        var noPrefixBlock = ""
                        
                        if let myContentArray = canReadData?.components(separatedBy: blockPrefix) {
                            noPrefixBlock = myContentArray[1]
                            print("noPrefixBlock ==> \(noPrefixBlock)")
                        }
                        
                        let blockSubfix = "]"
                        var noSubfixBlock = ""
                        
                        let myContent2Array = noPrefixBlock.components(separatedBy: blockSubfix)
                        
                        noSubfixBlock = myContent2Array[0]
                        print("noSubfixBlock ==> \(noSubfixBlock)")
                        
//                        Wait Here
                        self.convertJsonToDictionary(jsonString: noSubfixBlock)
                        
                        
                        
                    }   // if3
                }   // if2
            }   // if1
            
            
        }   // task
        task.resume()
        
    }   // checkAuthen
    
    func test(testString: String) -> Void {
        print("Receive ==> \(testString)")
//        showAlert(myTitle: "User False", myMessage: "Try")
    }
    
    func convertJsonToDictionary(jsonString: String) -> Void {
        
        var dictionary: NSDictionary?
        
        if let data = jsonString.data(using: String.Encoding.utf8) {
            
            do {
                
                dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let myDictionary = dictionary {
                    print("myDictionary ==> \(myDictionary)")
                    
//                    Check Password
                    if passwordString == myDictionary["Password"] as? String {
                        
                        print("Welcome ==> \(myDictionary["Name"] as! String)")
//                        Wait
                        
//                       Move To MyContent
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "gotoMyContent", sender: self)
                        }
                        
                        
                        
                    } else {
                        print("Password false")
                    } // if2
                }   // if1
                
            } catch let error as NSError {
                print("Have Error ==> \(error)")
            }
            
            
        }   // if
    }   // convert
    
    
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

