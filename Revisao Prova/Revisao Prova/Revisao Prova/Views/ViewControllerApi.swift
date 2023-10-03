//
//  ViewControllerApi.swift
//  Revisao Prova
//
//  Created by COTEMIG on 09/08/23.
//

import UIKit

protocol NewLivroViewControllerDelegate: AnyObject {
    func saveNew(cep:CepResponseData)
}

class ViewControllerApi: UIViewController {

    @IBOutlet weak var txtcep: UITextField!
    @IBOutlet weak var txtresult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func searchTapped(_ sender: Any) {
                self.txtresult.text = ""
                guard let cep = txtcep.text,
                      !cep.isEmpty && cep.count == 8 else {
                    self.txtresult.text = "Digite seu Cep é obrigatório (com 8 digitos numéricos)"
                    return
                }
                if let url = URL(string:"https://viacep.com.br/ws/\(cep)/json"){
                    let urlSession = URLSession.shared
                    urlSession.dataTask(with: url) { [weak self] data, response, error in
                        guard let self = self else { return }
                        if let resultData = data {
                            do {
                                let localStruct = try JSONDecoder().decode(CepResponseData.self, from: resultData)
                                DispatchQueue.main.async {
                                    self.txtresult.text = localStruct.toString()
                                }
                            } catch {
                                print("==> Erro no total de struct")
                            }
                }
                if let resultError = error {
                            print("==> Erro ao digitar: \(resultError)")
                        }
            }.resume()
    }
    

}
    weak var delegate : NewLivroViewControllerDelegate?
    
    @IBAction func btnSalvar(_ sender: Any) {
        self.txtresult.text = ""
        guard let cep = txtcep.text,
              !cep.isEmpty && cep.count == 8 else {
            self.txtresult.text = "Digite seu Cep é obrigatório (com 8 digitos numéricos)"
            return
        }

        if let url = URL(string:"https://viacep.com.br/ws/\(cep)/json") {
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if let resultData = data {
                    do {
                        let localStruct = try JSONDecoder().decode(CepResponseData.self, from: resultData)
                        self.delegate?.saveNew(cep: localStruct)
                        DispatchQueue.main.async {
                            self.txtresult.text = localStruct.toString()
                        }
                    } catch {
                        print("==> Erro no total de struct")
                    }
        }
        if let resultError = error {
                    print("==> Erro ao digitar: \(resultError)")
                }
    }.resume() 
            self.navigationController?.popViewController(animated: true)
        }
        /*
            if let item = self.cepData,
                let localDelegate = self.delegate {
                    localDelegate.salvar(item:item)
                    self.navigationController?.popViewController(animated: true)
                }
        */
        

    }
}
