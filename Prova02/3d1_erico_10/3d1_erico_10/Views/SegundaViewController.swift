//
//  SegundaViewController.swift
//  3d1_erico_10
//
//  Created by COTEMIG on 16/08/23.
//

import UIKit

class SegundaViewController: UIViewController {
    var apiData: Api? = nil
    @IBOutlet weak var txtResultado: UITextView!
    @IBOutlet weak var btnSalvar: UIButton!
    var ocupado = false
    var delegate : ApiProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "API Tasks"
        self.btnSalvar.isEnabled = false

    }
    
    @IBAction func btnReq(_ sender: Any) {
        self.btnSalvar.isEnabled = false
        self.apiData = nil
        txtResultado.text = ""
        if ocupado {
            return
        }
        ocupado = true
        
        let url = "https://www.boredapi.com/api/activity"
        if let customUrl = URL(string: url) {
            let request = URLSession.shared
            request.dataTask(with: customUrl) {
                [weak self] data, response, error in
                guard let self = self else {return}
                if error != nil {
                    self.txtResultado.text = "Erro na requisicao"
                } else {
                    if let resultData = data{
                        print(resultData)
                        do {
                            let item = try JSONDecoder().decode(Api.self, from: resultData)
                            self.apiData = item
                            DispatchQueue.main.async {[weak self] in
                                guard let self = self else {return}
                                self.txtResultado.text = item.toString()
                                self.btnSalvar.isEnabled = true
                            }
                        } catch {
                            self.txtResultado.text = "Erro no parsing"
                        }
                    }
                }
                self.ocupado = false
            }.resume()
        } else {
            self.ocupado = false
        }
    }
    
    @IBAction func Cadastrar(_ sender: Any) {
        if let item = self.apiData,
           let localDelegate = self.delegate {
            localDelegate.salvar(item: item)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
