//
//  ViewController.swift
//  Revisao Prova
//
//  Created by COTEMIG on 09/08/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell {
            let item = lista[indexPath.row]
            cell.carregar(cep: item)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    

    @IBOutlet weak var TableView: UITableView!

    var lista: [CepResponseData] = []
    var userDefaults = UserDefaults.standard
    var listKey = "Cep"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        carregarLista()
        self.navigationItem.title = "Home"
        TableView.reloadData()
    }
    
    @IBAction func BtnAdd(_ sender: Any) {
        let tela = ViewControllerApi()
        tela.delegate = self
        self.navigationController?.pushViewController(tela, animated: true)
    }
    private func carregarLista(){
        guard let listData = userDefaults.value(forKey: listKey) as? Data else {
            lista = []
            return
        }
        do {
            let saveList = try JSONDecoder().decode([CepResponseData].self, from: listData)
            lista = saveList
        } catch{
            print("erro ao recuperar dados.")
        }
        TableView.reloadData()
    }

}

extension ViewController: NewLivroViewControllerDelegate {
    func saveNew(cep: CepResponseData) {
        lista.append(cep)
        do {
            let saveList = try JSONEncoder().encode(lista)
            userDefaults.setValue(saveList, forKey: listKey)
        } catch {
            print ("erro ao recuperar dados")
        }
        TableView.reloadData()
    }
    
    
}

