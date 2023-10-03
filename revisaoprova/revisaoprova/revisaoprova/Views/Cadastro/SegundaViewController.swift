//
//  SegundaViewController.swift
//  revisaoprova
//
//  Created by COTEMIG on 09/08/23.
//

import UIKit

class SegundaViewController: UIViewController {
    private var isBusy = false
    private var contadordeBloqueio = 1
    @IBOutlet weak var txtCep: UITextField!
    @IBOutlet weak var txtResult: UITextView!
    var cep: CepResponseData? = nil
    var delegate : CepResponseProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchTapped(_ sender: Any) {
        if isBusy {
            print("Bloqueou\(contadordeBloqueio)")
            contadordeBloqueio += 1
            return
        }
        self.isBusy = true
        self.txtResult.text = ""
        guard let cep = txtCep.text, !cep.isEmpty && cep.count == 8 else {
            self.txtResult.text = "CEP e obrigatorio (com 8 digitos numericos)"
            isBusy = false
            return
        }
        
        if let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") {
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if let resultData = data {
                    print(resultData)
                    do {
                        let localStruct = try JSONDecoder().decode(CepResponseData.self, from: resultData)
                        DispatchQueue.main.async {
                            self.txtResult.text = localStruct.toString()
                        }
                        delegate?.saveNew(CepResponseData: cep)
                        self.navigationController?.popViewController(animated: true)
                    } catch {
                        print("==> Erro no parser da struct")
                    }
                }
                if let resultError = error {
                    print("==> Erro na requisicao:\(resultError)")
                }
                self.isBusy = false
            }.resume()
        } else{
            self.isBusy = false
        }
    }

    @IBAction func Cadastrar(_ sender: Any) {
        if let item = self.cep,
           let localDelegate = self.delegate{
            localDelegate.salvar(item: item)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
