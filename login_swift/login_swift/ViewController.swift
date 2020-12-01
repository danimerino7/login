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
    @IBOutlet weak var wrongpass: UILabel!
    @IBOutlet weak var registrado: UILabel!
    
  let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
       let register = defaults.string(forKey: "registrado")
        let pass = defaults.string(forKey: "password")
        let user = defaults.string(forKey: "usuario")
        
        usuario.text = user
        password.text = ""
        
        if register != "" {
            logueo()
            NSLog("Ya registrado? :\(register ?? "sin registro")")
            NSLog("Contraseña :  \(pass ?? "sin registro")")
            NSLog("usuario : \(user ?? "sin registro")")
        }
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
            //si el campo esta vacio aparece error de campo hidden
        if  usuario.text == "" {
            erroruser.isHidden = false
            erroruser.text = "*usuario obligatorio"
            
        }else {
            //Si no, se guarda el campo usuario en el user default y desaparece el campo error
            defaults.setValue(usuario.text, forKey: "usuario")
            erroruser.isHidden = true
        }
        
        //igual pero con la contraseña
        if password.text == "" {
            wrongpass.text = "*pass obligatoria"
            wrongpass.isHidden = false
        }else {
            defaults.setValue(password.text, forKey: "password")
            wrongpass.isHidden = true
            logueo()
        }
    }
    
    //funcion para cambiar la actividad desde la navegacion raiz
    func logueo () {
        var _ =  UIStoryboard(name:"Main",bundle: nil)
        let segunda = storyboard?.instantiateViewController(identifier: "second") as! vista2
        navigationController?.pushViewController(segunda, animated: false)
    }
    
    func post(){
        
        //para enviar los datos a la api
        
        let Url = String(format: "https://qastusoft.com.es/apis/login2.php")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        let bodyData = "user=Test&pass=Test."
        request.httpBody = bodyData.data(using: String.Encoding.utf8);

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    

}

