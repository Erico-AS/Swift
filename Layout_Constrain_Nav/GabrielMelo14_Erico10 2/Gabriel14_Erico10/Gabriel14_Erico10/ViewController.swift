//
//  ViewController.swift
//  Gabriel14_Erico10
//
//  Created by COTEMIG on 15/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if let email = txtEmail.text,
           let pass = txtPassword.text,
           email.count > 0 && pass.count > 0 {
            
            let user = Usuario(email: email, password: pass)
            performSegue(withIdentifier: "GoToView3", sender: user)
        }else {
        
        performSegue(withIdentifier: "GoToView2", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TerceiraViewController,
            let usuario = sender as? Usuario {
            vc.mensagem = usuario
        }
    }
}


struct Usuario {
    var email: String
    var password: String
}
