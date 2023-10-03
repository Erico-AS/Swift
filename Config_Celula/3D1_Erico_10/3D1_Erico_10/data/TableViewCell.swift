//
//  TableViewCell.swift
//  3D1_Erico_10
//
//  Created by COTEMIG on 03/05/23.
//

import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet var lblTitulo: UILabel!
    @IBOutlet var lblDetails: UILabel!
    @IBOutlet var lblDuracao: UILabel!
    
    func populate(filme: Filme) {
        lblTitulo.text = filme.titulo
        lblDetails.text = "\(filme.diretor) - \(filme.ano)"
        lblDuracao.text = filme.duracao
    }

}
