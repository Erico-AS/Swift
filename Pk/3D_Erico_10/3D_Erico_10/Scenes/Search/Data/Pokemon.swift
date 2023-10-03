struct Pokemon: Codable {
    let abilities: [Ability]?
    let height, id, weight: Int?
    let name: String?
    let sprites: Sprite?
    let forms: [BaseAbility]?
}

struct Ability: Codable {
    let ability: BaseAbility?
    let is_hidden: Bool?
    let slot: Int?
}

struct BaseAbility: Codable {
    let name, url: String?
}

struct Sprite: Codable {
    let front_default: String?
}
