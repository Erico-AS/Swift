//
//  TableViewCell.swift
//  Revisao Prova
//
//  Created by COTEMIG on 09/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    func carregar (cep: CepResponseData){
        lbl1.text = cep.cep
        lbl2.text = "\(cep.complemento ?? "") - \(cep.bairro ?? "")"
        lbl3.text = cep.uf
    }
}
