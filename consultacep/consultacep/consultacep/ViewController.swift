//
//  ViewController.swift
//  consultacep
//
//  Created by COTEMIG on 21/06/23.
//

import UIKit

class ViewController: UIViewController {

    private var isBusy = false
    @IBOutlet weak var txtCep: UITextField!
    @IBOutlet weak var txtResultado: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    var contadorBloqueio = 1
    
    @IBAction func Consultar(_ sender: Any) {
        if isBusy == true {
            print("block \(contadorBloqueio)")
            contadorBloqueio += 1
            return
        }
        self.txtResultado.text = ""
        isBusy = true
        guard let cep = txtCep.text,
              !cep.isEmpty && cep.count == 8 else {
            self.txtResultado.text = "CEP é obrigaório (com 8 digitos numéricos)"
            isBusy = false
            return
        }
        
        if let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") {

            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) {[weak self] data, response, error in
                guard let self = self else { return }
                if let resultData =  data {
                    print(resultData)
                    do {
                        let localStruct = try JSONDecoder().decode(CepResponseData.self, from: resultData)
                        DispatchQueue.main.async {
                            self.txtResultado.text = localStruct.toString()
                        }
                    } catch {
                        print("==> Erro no parse")
                    }
                }
                if let resultError = error {
                    print("==> Erro na requisição: \(resultError)")
                }
                self.isBusy = false
            }.resume()
        } else {
            self.isBusy = false
        }
    }
}

