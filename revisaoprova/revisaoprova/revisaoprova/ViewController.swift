//
//  ViewController.swift
//  revisaoprova
//
//  Created by COTEMIG on 09/08/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var lista : [CepResponseData] = []
    var userDefault = UserDefaults.standard
    var listKey = "CepResponseData"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? CelulaCustomizada {
                let item = lista[indexPath.row]
                cell.carregar(CepResponseData:item)
                return cell
            }
            return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    @IBOutlet weak var Tabela: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabela.dataSource = self
        Tabela.delegate = self
    }
    
    private func carregarLista(){
        guard let listData = userDefault.value(forKey: listKey) as? Data else{
            lista = []
            return
        }
        do {
            let savedList = try JSONDecoder().decode([CepResponseData].self, from: listData)
            lista = savedList
            Tabela.reloadData()
        }
        catch {
            print("Erro ao recuperar dados")
        }
        tabela.reloadData()
    }

    @IBAction func proxPag(_ sender: Any) {
        let vc = SegundaViewController()
        vc.delegate = self
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
}

extension ViewController: CepResponseProtocol{
    func salvar(item: CepResponseData) {
        lista.append(item)
        do {
            let serialezedList = try JSONEncoder().encode(self.lista)
            userDefault.setValue(serialezedList, forKey: listKey)
        } catch {
            lista.removeAll(where: {$0.CepResponseData == item.CepResponseData})
        }
            self.tabela.reloadData()
        }
    }
