//
//  TableViewCell.swift
//  3d1_erico_10
//
//  Created by COTEMIG on 06/09/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblTexto: UILabel!
    
    
    public func carregar(item:String) {
        lblTexto.text = item
    }
}
