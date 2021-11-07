//
//  ViewController.swift
//  LoginTestApp
//
//  Created by pizza on 08/10/2021.
//  Copyright © 2021 pizza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var status : Bool = false
    // MARK: - Outlets
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var buttonVhod: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var textStatus: UILabel!
    @IBOutlet weak var textPass: UITextField!
   
    // MARK: - Actions
    
    @IBAction func buttonRegDown(_ sender: Any) {
      if !textName.text!.isEmpty && !textPass.text!.isEmpty {
        KeychainSingletone.sharedInstance.saveKey(textNameK: textName.text!, textPassK: textPass.text!)
        UserDefaults.standard.set(true, forKey: "status")
        textPass.text?.removeAll()
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcMain")
        self.present(vc!, animated: true, completion: nil)
      }
      
    }
    
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
        print("edit func")
        
    }
    @IBAction func buttonDown(_ sender: UIButton) {
        
        if !textName.text!.isEmpty && !textPass.text!.isEmpty {
            if KeychainSingletone.sharedInstance.readKey(textNameK: textName.text!) == textPass.text {
                UserDefaults.standard.set(true, forKey: "status")
                textPass.text?.removeAll()
                let vc = storyboard?.instantiateViewController(withIdentifier: "vcMain")
                self.present(vc!, animated: true, completion: nil)
            } else {
                textStatus.text = "отказ в доступе"
            }
        }
        print(#line, "press button func end")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#line, #function, " begin")
        if UserDefaults.standard.value(forKey: "status") == nil {
            UserDefaults.standard.set(false, forKey: "status")
        }
        // if user is singed (first lounch)
        if  UserDefaults.standard.bool(forKey: "status") {
            print(#line, #function, "status true")
            let vc = storyboard?.instantiateViewController(withIdentifier: "vcMain")
            self.addChild(vc!)
            self.view.addSubview(vc!.view)
            vc!.didMove(toParent: self)
        }
        print(#line, #function, " end")
        
    }
    
        
    

}

