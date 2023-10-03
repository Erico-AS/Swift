//
//  ViewController.swift
//  3D_Erico_10
//
//  Created by COTEMIG on 20/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fake = FakeViewController()
        self.navigationController?.pushViewController(fake, animated: false)
    }

    @IBAction func goToSearch(_ sender: Any) {
        let Search = SearchViewController()
        self.navigationController?.pushViewController(Search, animated: true)
    }
    
}

