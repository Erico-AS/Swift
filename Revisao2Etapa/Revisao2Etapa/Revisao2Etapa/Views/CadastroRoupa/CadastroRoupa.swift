//
//  CadastroRoupa.swift
//  Revisao2Etapa
//
//  Created by COTEMIG on 02/08/23.
//

import UIKit

class CadastroRoupa: UIViewController {
    @IBOutlet weak var txtResultado: UITextView!
    @IBOutlet weak var btnSalvar: UIButton!
    private var cepData : Cep? = nil
    var ocupado = false
    var delegate : CepResponseProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "API de CEP"
        self.btnSalvar.isEnabled = false
    }
    
    @IBAction func btnReq(_ sender: Any) {
        self.btnSalvar.isEnabled = false
        self.cepData = nil
        txtResultado.text = ""
        if ocupado {
            return
        }
        ocupado = true
        
        let url = "https://viacep.com.br/ws/30575100/json/"
        if let customUrl = URL(string: url) {
            let request = URLSession.shared
            request.dataTask(with: customUrl) {
                [weak self] data, response, error in
                guard let self = self else {return}
                if let erro = error {
                    self.txtResultado.text = "Erro na requisicao"
                } else {
                    if let resultData = data{
                        print(resultData)
                        do {
                            let item = try JSONDecoder().decode(Cep.self, from: resultData)
                            self.cepData = item
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
        if let item = self.cepData,
           let localDelegate = self.delegate{
            localDelegate.salvar(item: item)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
