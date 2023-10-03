import UIKit
import Alamofire
import Kingfisher

class SearchViewController: UIViewController {
    let apiUrl = "https://pokeapi.co/api/v2/pokemon/"
    @IBOutlet weak var btnSalvar: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblDetalhes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
        lblDetalhes.text = ""
    }
    
    private func createButton() {
        let item = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchPokemon))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc private func searchPokemon(_ sender: UIBarButtonItem) {
        sender.isEnabled = false
        self.btnSalvar.isEnabled = false
        
        let cod = Int.random(in: 1..<1001)
        let url = "\(apiUrl)\(cod)"
        AF.request(url).responseDecodable(of: Pokemon.self) {[ weak self ] response in
            guard let self = self else {return}
            
            if let bichinho = response.value {
                self.lblDetalhes.text = bichinho.name ?? "Nao carregando"
                
                if let sprite = bichinho.sprites,
                   let urlFront = sprite.front_default {
                    self.image.kf.setImage(with: URL(string: urlFront))
                }
            }
        }
        sender.isEnabled = true
        self.btnSalvar.isEnabled = true
    }
}
