import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tabela: UITableView!
    var lista : [Cep] = []
    var listKey = "cep"
    var userDefault = UserDefaults.standard
    
    @IBAction func btnAdd(_ sender: Any) {
        let viewCadastroRoupa = CadastroRoupa()
        viewCadastroRoupa.delegate = self
        self.navigationController?.pushViewController(viewCadastroRoupa, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaDados()
        tabela.dataSource = self
        tabela.delegate = self
    }
    
    private func carregaDados() {
        guard let listData = userDefault.value(forKey: listKey) as? Data else {
            lista = []
            return
        }
        do {
            let savedList = try JSONDecoder().decode([Cep].self, from : listData)
            lista = savedList
        } catch {
            print("Erro ao recuperar os dados")
        }
        tabela.reloadData()
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
        cell.cellPopulation(cep: item)
        return cell
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

extension ViewController: CepResponseProtocol{
    func salvar(item: Cep) {
        lista.append(item)
        do {
            let serialezedList = try JSONEncoder().encode(self.lista)
            userDefault.setValue(serialezedList, forKey: listKey)
        } catch {
            lista.removeAll(where: {$0.cep == item.cep})
        }
            self.tabela.reloadData()
        }
    }
