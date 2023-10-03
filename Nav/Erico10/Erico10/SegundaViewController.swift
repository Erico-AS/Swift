//
//  SegundaViewController.swift
//  Erico10
//
//  Created by COTEMIG on 29/03/23.
//

import UIKit

class SegundaViewController: UIViewController {

    @IBOutlet weak var lblPara: UILabel!
    @IBOutlet weak var lblAssunto: UILabel!
    @IBOutlet weak var lblMenssagem: UITextView!
    public var email: Email?
    override func viewDidLoad() {
        super.viewDidLoad()

        lblPara.text = email?.para
        lblAssunto.text = email?.assunto
        lblMenssagem.text = email?.menssagem
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
