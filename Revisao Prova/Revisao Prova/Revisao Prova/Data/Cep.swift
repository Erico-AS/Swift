struct CepResponseData : Codable{
    
    let cep,
    logradouro,
    complemento,
    bairro,
    localidade,
    uf,
    ibge,
    gia,
    ddd,
    siafi: String?
    
    public func toString() -> String{
        return"\(cep ?? "") \n \(logradouro ?? "") \n \(complemento ?? "") \n \(bairro ?? "") \n \(localidade ?? "") \n \(uf ?? "") \n \(ddd ?? "")"
    }
}

