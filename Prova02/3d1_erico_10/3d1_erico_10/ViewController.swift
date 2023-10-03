import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tabela: UITableView!
    var lista : [Api] = []
    var listKey = "api"
    var userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        carregar()
        tabela.dataSource = self
        tabela.delegate = self
    }

    @IBAction func ir(_ sender: Any) {
        let vc = SegundaViewController()
        vc.delegate = self
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
    private func carregar() {
        guard let listData = userDefault.value(forKey: listKey) as? Data else {
            lista = []
            return
        }
        do {
            let savedList = try JSONDecoder().decode([Api].self, from : listData)
            lista = savedList
        } catch {
            print("Erro ao recuperar os dados")
        }
        tabela.reloadData()
    }
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Celula else {
            return UITableViewCell()
        }
        let item = self.lista[indexPath.row]
        cell.cellPopulation(api: item)
        return cell
    }
}

extension ViewController: ApiProtocol{
    func salvar(item: Api) {
        lista.append(item)
        do {
            let serialezedList = try JSONEncoder().encode(self.lista)
            userDefault.setValue(serialezedList, forKey: listKey)
        } catch {
            lista.removeAll(where: {$0.key == item.key})
        }
            self.tabela.reloadData()
        }
}

