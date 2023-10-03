import Foundation

protocol CepResponseProtocol : AnyObject  {
    func salvar(item: Cep)
}

struct Cep : Codable {
    let cep,
        logradouro,
        bairro,
        localidade,
        uf : String?
    
    public func toString() -> String {
        return "\(cep!) -> \(logradouro!), \(bairro!), \(localidade!), \(uf!)"
    }
}
