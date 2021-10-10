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
    static
    @IBAction func save(_ sender: UIButton) {
        let myKeychain: Keychain
        myKeychain = Keychain()
        myKeychain[textName.text!] = textPass.text
        
    }
     /*
     func saveAction(sender: UIButton) {
     let myKeychain: Keychain
     keychain = Keychain()
     keychain[textName.text!] = textPass.text
     }
     */
   
    @IBAction func editingChanged(_ sender: UITextField) {
        switch (textName.text, textPass.text) {
        case let (username?, password?):
            buttonVhod.isEnabled = !username.isEmpty && !password.isEmpty
        case (_?, nil):
            buttonVhod.isEnabled = false
        case (nil, _?):
            buttonVhod.isEnabled = false
        case (nil, nil):
            buttonVhod.isEnabled = false
            
    }
     private init() {
        }
    }
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

