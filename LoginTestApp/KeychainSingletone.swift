//
//  KeychainSingletone.swift
//  LoginTestApp
//
//  Created by pizza on 08/11/2021.
//  Copyright © 2021 pizza. All rights reserved.
//

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
        let token = try? myKeychain.getString(textNameK)
        if token == nil {
            return ""
        }
        else {
            return token! ?? ""
        }
        //print(#line, #function)
        
    }
    private init() {}
}
