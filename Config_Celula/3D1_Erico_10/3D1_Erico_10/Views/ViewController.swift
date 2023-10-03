//
//  ViewController.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 03/05/23.
//

import UIKit


class ViewController: UIViewController {
    var lista: [Filme] = []
    
    @IBOutlet var table: UITableView!
    @IBOutlet var tablev: UIView!
    let listkey = "Filmes"
    let userdefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        carregarLista()
    }
    @IBAction func cadastro(_ sender: Any) {
        let vc = NewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func carregarLista() {
        guard let listdata = userdefault.value(forKey: listkey) as? Data else {
            lista = []
            return
        }
        do {
            let savedlist = try JSONDecoder().decode([Filme].self, from: listdata)
            lista = savedlist
            table.reloadData()
        } catch {
            print("erro")
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cel1") {
            let item = lista[indexPath.row]
            if let customCell = cell as? TableViewCell {
                customCell.populate(filme: item)
                return customCell
            }
        }
        return UITableViewCell()
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = lista[indexPath.row]
        let vc = ViewController2()
        
        vc.filme = item
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController : ViewController2Delegate {
    func deleteItem(filme: Filme) {
        var i: Int?
        if let index = lista.firstIndex(where: { $0.ano == filme.ano }) {
            i = index
            lista.removeAll(where: { $0.ano == filme.ano })
        }
        
        do {
            let serializedList = try JSONEncoder().encode(lista)
            userdefault.setValue(serializedList, forKey: listkey)

        }
        catch {
            if let index = i {
                lista.insert(filme, at: index)
                print(lista)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {[weak self] in guard let context =  self else {
                return
            }
            context.table.reloadData()
        })
    }
}

extension ViewController : NewControllerDelegate {
    func saveNew(filme : Filme){
            lista.append(filme)
            do {
                let serializeList = try JSONEncoder().encode(lista)
                userdefault.setValue(serializeList, forKey: listkey)
            } catch {
                lista.removeAll(where: {$0.titulo == filme.titulo && $0.diretor == filme.diretor})
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: { [weak self] in guard let context = self else {
                return
            }
            
                context.table.reloadData()
            })
            
        }
}

