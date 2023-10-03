//
//  ViewController.swift
//  3d1_erico_10
//
//  Created by COTEMIG on 06/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Tabela: UITableView!
    var lista : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Tabela.dataSource = self
        self.Tabela.delegate = self
        carregarLista()
    }
    
    func carregarLista() {
        self.lista = ["Messi", "Neymar", "Remy", "Sheldon", "Feyman", "Cooper", "Einstain"]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell {
            cell.carregar(item: self.lista[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lista.count
    }
}
