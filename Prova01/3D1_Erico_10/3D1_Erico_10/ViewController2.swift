//
//  ViewController2.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 26/04/23.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblFilme: UILabel!
    @IBOutlet weak var lblDados: UILabel!
    var film : filme? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitulo.text = "Duraçäo - " + film!.duracao
        lblFilme.text = film?.titulo
        lblDados.text = film?.diretor
        lblDados.text! += " "
        lblDados.text! += film!.ano
    }
}
