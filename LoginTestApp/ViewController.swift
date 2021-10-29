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
    var status = UserDefaults.standard.value(forKey: "status") as? Bool
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
    var status : Bool = false
    // MARK: - Outlets
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var buttonVhod: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var textStatus: UILabel!
    @IBOutlet weak var textPass: UITextField!
   
    // MARK: - Actions
    @IBAction func save(_ sender: UIButton) {
        KeychainSingletone.sharedInstance.saveKey(textNameK: textName.text!, textPassK: textPass.text!)
        print(#line , #function, "bad save")
    }
    
    @IBAction func buttonRegDown(_ sender: Any) {
       //KeychainSingletone.sharedInstance.saveKey(textNameK: textName.text!, textPassK: textPass.text!)
        print(#line, #function)
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcMain")
        self.present(vc!, animated: true, completion: nil)
        //performSegue(withIdentifier: "goVC", sender: nil)
        //let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle                                                                                                                                                                                                                                                                                                    )
        
    }
    
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
        
        if !textName.text!.isEmpty && !textPass.text!.isEmpty {
            if KeychainSingletone.sharedInstance.readKey(textNameK: textName.text!) == textPass.text {
                UserDefaults.standard.set(true, forKey: "status")
                print(KeychainSingletone.sharedInstance.readKey(textNameK: textName.text!),"-read key")
                print(#line, " sovpadenie")
            }
        }
      //  isBut1Down = true
        print("press button func")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load func begin")
        if UserDefaults.standard.value(forKey: "status") == nil {
            UserDefaults.standard.set(false, forKey: "status")
            status = false
        }
        // try? textStatus.text = String(UserDefaults.standard.bool(forKey: "status"))
        // if user is singed in and button ..Voiti.. is down (first lounch)
        if  UserDefaults.standard.bool(forKey: "status")/* && !isBut1Down */ {
            print("did load func - status true")
            performSegue(withIdentifier: "goVC", sender: nil)
        }
        print("did load func end")
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
        
    

}

