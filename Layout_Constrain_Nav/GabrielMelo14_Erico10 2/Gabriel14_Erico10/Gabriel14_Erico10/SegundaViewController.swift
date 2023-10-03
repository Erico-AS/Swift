//
//  SegundaViewController.swift
//  Gabriel14_Erico10
//
//  Created by COTEMIG on 22/03/23.
//

import UIKit

class SegundaViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblErro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonCad(_ sender: Any) {
        if let email = txtEmail.text,
           let pass = txtPassword.text,
           email.count > 9 && pass.count > 7 {
            let user = Usuario(email: email, password: pass)
            performSegue(withIdentifier: "GoToView3", sender: user)
        } else {
            lblErro.text = "Nao cadastrou Nao cadastrou Nao cadastrou Nao cadastrou"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewControllerDestino = segue.destination as? TerceiraViewController
        let Usuario = sender as? Usuario
        viewControllerDestino?.mensagem = Usuario
    }
}
