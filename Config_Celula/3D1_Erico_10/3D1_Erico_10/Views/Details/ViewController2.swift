//
//  ViewController2.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 17/05/23.
//

import UIKit

protocol ViewController2Delegate : AnyObject {
    func deleteItem(filme : Filme)
}

class ViewController2: UIViewController {
    weak var delegate: ViewController2Delegate? = nil
    var filme : Filme? = nil
    
    @IBOutlet var Titulo: UILabel!
    @IBOutlet var Diretor: UILabel!
    @IBOutlet var Ano: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Titulo.text = filme?.titulo
        Ano.text = filme?.ano
        Diretor.text = filme?.diretor
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Confirmação", message: "Deseja realmente excluir?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: {c in print("cancelou")}))
        alert.addAction(UIAlertAction(title: "Excluir", style: UIAlertAction.Style.destructive, handler: { action in
            if let item = self.filme,
                let delegateNoNulo = self.delegate {
                delegateNoNulo.deleteItem(filme: item)
            }
            print("a")
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
