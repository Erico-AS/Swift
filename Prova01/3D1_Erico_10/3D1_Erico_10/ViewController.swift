//
//  ViewController.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 26/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var lista: [filme] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = filme(titulo: "Cars", diretor: "José", ano: "2005", duracao: "60min")
        let item2 = filme(titulo: "Cars2", diretor: "Joao", ano: "2006", duracao: "80min")
        let item3 = filme(titulo: "Cars3", diretor: "Joaquim", ano: "2007", duracao: "100min")
        let item4 = filme(titulo: "Ratatouille", diretor: "Erico", ano: "2010", duracao: "120min")
        let item5 = filme(titulo: "Up - Altas Aventuras", diretor: "Ercio", ano: "2009", duracao: "140min")
        
        lista.append(item1)
        lista.append(item2)
        lista.append(item3)
        lista.append(item4)
        lista.append(item5)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cel1") {
                    let item = lista[indexPath.row]
                    cell.textLabel?.text = item.titulo
                    cell.detailTextLabel?.text = item.diretor + " " + item.ano
                    return cell
                }
                return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = lista[indexPath.row]
        performSegue(withIdentifier: "GoToView2", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let p = sender as? filme,
           let t = segue.destination as? ViewController2 {
            t.film = p
        }
    }

}
struct filme {
    var titulo : String
    var diretor : String
    var ano : String
    var duracao : String
}

