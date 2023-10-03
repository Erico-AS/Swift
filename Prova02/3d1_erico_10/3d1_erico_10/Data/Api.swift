import Foundation

protocol ApiProtocol : AnyObject  {
    func salvar(item:Api)
}

struct Api : Codable {
    let activity,
    type,
    link,
    key: String?
    
    let participants: Int?
    
    let price,
    accessibility:Double?

    public func toString() -> String {
        return "\(activity!) -> \(type!), \(link!), \(key!), \(participants!), \(price!), \(accessibility!)"
    }
}
