//
//  CatBreed.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 28.03.2022.
//

import Foundation

struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage?
    
    var description: String {
        return "Breed with name: \(name) and id: \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    init(name: String, id: String, temperament: String, explaination: String, energyLevel: Int, isHairless: Bool, image: BreedImage?) {
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.isHairless = isHairless
        self.image = image
    }
    
    static func example1() -> Breed {
        return Breed(name: "Abyssinian", id: "abys", temperament: "haba", explaination: "haba", energyLevel: 2, isHairless: true, image: nil)
    }
    
    static func example2() -> Breed {
        return Breed(name: "Cyprus", id: "cypr", temperament: "baha", explaination: "baha", energyLevel: 4, isHairless: false, image: nil)
    }
}






