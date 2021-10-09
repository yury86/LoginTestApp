//
//  ViewController.swift
//  LoginTestApp
//
//  Created by pizza on 08/10/2021.
//  Copyright © 2021 pizza. All rights reserved.
//

import UIKit
import KeychainAccess

class KeychainSingletone : UIViewController {
    static let key1 : Int32 = 0
   
     func saveAction(sender: UIBarButtonItem) {
     let keychain: Keychain
     if let service = serviceField.text, !service.isEmpty {
     keychain = Keychain(service: service)
     } else {
     keychain = Keychain()
     }
     keychain[usernameField.text!] = passwordField.text
     
     dismiss(animated: true, completion: nil)
     }
   /*
     @IBAction func editingChanged(sender: UITextField) {
     switch (usernameField.text, passwordField.text) {
     case let (username?, password?):
     saveButton.isEnabled = !username.isEmpty && !password.isEmpty
     case (_?, nil):
     saveButton.isEnabled = false
     case (nil, _?):
     saveButton.isEnabled = false
     case (nil, nil):
     saveButton.isEnabled = false
     }
     private init() {
     
    }*/

}

class ViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var buttonVhod: UIButton!
    
    @IBOutlet weak var textPass: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

