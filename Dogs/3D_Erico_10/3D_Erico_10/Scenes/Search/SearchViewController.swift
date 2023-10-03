import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var btnSalvar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchPokemon))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func searchPokemon(_ sender: UIBarButtonItem) {
        sender.isEnabled = false
        self.btnSalvar.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {[weak self] in
            guard let self = self else { return }
            self.btnSalvar.isEnabled = true
            sender.isEnabled = true
        })
    }
}
