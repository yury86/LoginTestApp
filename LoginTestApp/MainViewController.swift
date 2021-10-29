//
//  MainViewController.swift
//  LoginTestApp
//
//  Created by pizza on 30/10/2021.
//  Copyright © 2021 pizza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var buttonExit: UIButton!
    
   
    @IBAction func buttonExitPress(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "status")
        dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "goVC1", sender: nil)
        //self.show(vc, sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
