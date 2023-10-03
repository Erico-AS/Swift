import Foundation

struct CepResponseData: Codable {
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
    
    public func toString() -> String {
        return "\(cep!) -> \(String(describing: logradouro!)), \(bairro!), \(localidade!), \(uf!), DDD: \(ddd!)"
    }
}
