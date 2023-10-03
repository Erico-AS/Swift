//
//  TerceiraViewController.swift
//  Gabriel14_Erico10
//
//  Created by COTEMIG on 22/03/23.
//

import UIKit

class TerceiraViewController: UIViewController {
    var mensagem : Usuario?
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblSenha: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblEmail.text = mensagem?.email
        lblSenha.text = mensagem?.password
//
    }

}
