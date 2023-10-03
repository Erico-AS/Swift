//
//  NewController.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 31/05/23.
//

import UIKit

protocol NewControllerDelegate: AnyObject {
    func saveNew(filme: Filme)
}
class NewController: UIViewController {
    @IBOutlet var txtTitulo: UITextField!
    @IBOutlet var txtDiretor: UITextField!
    @IBOutlet var txtDuracao: UITextField!
    @IBOutlet var txtAno: UITextField!
    weak var delegate: NewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cad(_ sender: Any) {
        if let titulo = txtTitulo.text,
           let diretor = txtDiretor.text,
           let duracao = txtDuracao.text,
           let ano = txtAno.text,
           !titulo.isEmpty && !diretor.isEmpty && !duracao.isEmpty && !ano.isEmpty,
           let delegateNoNulo = delegate {
            let item = Filme(titulo: titulo, diretor: diretor, duracao: duracao, ano: ano)
            delegateNoNulo.saveNew(filme: item)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
