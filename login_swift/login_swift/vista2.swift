//
//  vista2.swift
//  login_swift
//
//  Created by A4-iMAC03 on 30/11/2020.
//

import UIKit

class vista2: UIViewController {
    
    
    @IBOutlet weak var nombreuser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //cargo el nombre del usuario recogido de user default al logear
        let defaults = UserDefaults.standard
        nombreuser.text = defaults.string(forKey: "usuario")
        
        defaults.setValue(defaults.string(forKey: "usuario"), forKey: "registrado")
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
	
