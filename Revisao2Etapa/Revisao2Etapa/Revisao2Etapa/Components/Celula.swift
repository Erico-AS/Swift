import UIKit

class Celula: UITableViewCell {

    @IBOutlet weak var lblRua: UILabel!
    @IBOutlet weak var lblBairro: UILabel!
    @IBOutlet weak var lblCidadeUf: UILabel!
    
    public func cellPopulation(cep : Cep) {
        lblRua.text = cep.logradouro
        lblBairro.text = cep.bairro
        lblCidadeUf.text = "\(cep.localidade!) - \(cep.uf!)"
    }
}
