//
//  FakeViewController.swift
//  3D_Erico_10
//
//  Created by COTEMIG on 20/09/23.
//

import UIKit

class FakeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: false)
        })
    }
}
