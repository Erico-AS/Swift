//
//  ViewController.swift
//  Erico10
//
//  Created by COTEMIG on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPara: UITextField!
    @IBOutlet weak var txtMenssagem: UITextView!
    @IBOutlet weak var txtAssunto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func Enviar(_ sender: Any) {
        let para = txtPara.text
        let assunto = txtAssunto.text
        let menssagem = txtMenssagem.text
    
        if para?.count != 0 && assunto?.count != 0 && menssagem?.count != 0 {
        let email = Email(para: para, assunto: assunto, menssagem: menssagem)
        performSegue(withIdentifier: "GoToView2", sender: email)
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerDestino = segue.destination as? SegundaViewController,
           let Email = sender as? Email {
           viewControllerDestino.email = Email
        }
    }
}
struct Email {
    var para : String?
    var assunto : String?
    var menssagem : String?
}
