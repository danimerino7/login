//
//  ViewController.swift
//  login_swift
//
//  Created by A4-iMAC03 on 30/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var erroruser: UILabel!
    @IBOutlet weak var errorpass: UILabel!
    
    
   // let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func login(_ sender: Any) {
        
        
        
        if ((usuario.text == "")) {
            erroruser.isHidden = false
            erroruser.text = "*usuario obligatorio"
            
        }else {
            erroruser.isHidden = true
        }
        
        
        if ((password.text == "")) {
            errorpass.isHidden = false
            errorpass.text = "*password obligatorio"
        }else {
            
            var _ =  UIStoryboard(name:"Main",bundle: nil)
            let segunda = storyboard?.instantiateViewController(identifier: "second") as! vista2
            navigationController?.pushViewController(segunda, animated: false)
            errorpass.isHidden = true
        }
        
        
    }
    
    
    


}

