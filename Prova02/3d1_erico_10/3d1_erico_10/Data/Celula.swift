//
//  Celula.swift
//  3d1_erico_10
//
//  Created by COTEMIG on 16/08/23.
//

import UIKit

class Celula: UITableViewCell {
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt1: UILabel!
    
    public func cellPopulation(api : Api) {
        txt1.text = api.activity
        txt2.text = api.type
        txt3.text = api.key
    }
}
