//
//  ViewController.swift
//  LoginTestApp
//
//  Created by pizza on 08/10/2021.
//  Copyright © 2021 pizza. All rights reserved.
//

import UIKit
import KeychainAccess

class KeychainSingletone {
    static let sharedInstance = KeychainSingletone()
    func saveKey(textNameK : String, textPassK : String ) {
        var myKeychain: Keychain
        myKeychain = Keychain()
        myKeychain[textNameK] = textPassK
        print("save func")
    }
    func readKey(textNameK: String) -> String {
        var myKeychain: Keychain
        myKeychain = Keychain()
        let token : String
        token = try! myKeychain.getString(textNameK)!
        print(#line, #function, token)
        return token
    }
    private init() {}
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var buttonVhod: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var textPass: UITextField!
   
    
    @IBAction func save(_ sender: UIButton) {
        KeychainSingletone.sharedInstance.saveKey(textNameK: textName.text!, textPassK: textPass.text!)
        print(#line , #function, "bad save")
    }
    /*
     func saveAction(sender: UIButton) {
     let myKeychain: Keychain
     keychain = Keychain()
     keychain[textName.text!] = textPass.text
     }
     */
    
    @IBAction func editingChanged(_ sender: UITextField) {
        ///let ViewController = super.presentingViewController
        
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
        print("edit func")
        
    }
    @IBAction func buttonDown(_ sender: UIButton) {
        //KeychainSingletone.sharedInstance.saveKey(textNameK: textName.text!, textPassK: textPass.text!)
        if !textName.text!.isEmpty && !textPass.text!.isEmpty {
            if KeychainSingletone.sharedInstance.readKey(textNameK: textName.text!) == textPass.text {
                print(KeychainSingletone.sharedInstance.readKey(textNameK: textName.text!),"-read key")
                print(#line, " sovpadenie")
            }
        }
        
        print("press button func")
        
    }
    @IBAction func buttonExitMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       print("did load func")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

