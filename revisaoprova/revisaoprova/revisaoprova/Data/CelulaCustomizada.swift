import Foundation
import UIKit


class CelulaCustomizada: UITableViewCell {
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDiretor: UILabel!
    @IBOutlet weak var lblAno: UILabel!

    
    public func carregar (CepResponseData:CepResponseData) {
        lblTitulo.text = CepResponseData.cep
        lblAno.text = CepResponseData.bairro
        lblDiretor.text = CepResponseData.complemento  
    }
    
}
