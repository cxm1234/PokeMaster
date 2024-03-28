//
//  Pokemon.swift
//  PokeMaster
//
//  Created by ming on 2024/3/28.
//

import Foundation

struct Pokemon: Codable {
    
    struct `Type`: Codable {
        struct Interal: Codable {
            let name: String
            let url: URL
        }
        
        let slot: Int
        let type: Interal
    }
    
    struct Stat: Codable {
        enum Case: String, Codable {
            case speed
            case specialDefense = "special-defense"
            case specialAttack = "special-attack"
            case defense
            case attack
            case hp
        }
        
        struct Interal: Codable {
            let name: Case
        }
        
        let baseStat: Int
        let stat: Interal
        
    }
    
    struct SpeciesEntry: Codable {
        let name: String
        let url: URL
    }
    
    struct AbilityEntry: Codable, Identifiable {
        struct Interal: Codable {
            let name: String
            let url: URL
        }
        
        var id: URL { ability.url }
        
        let slot: Int
        let ability: Interal
    }
    
    let id: Int
    let types: [Type]
    let abilities: [AbilityEntry]
    let stats: [Stat]
    let species: SpeciesEntry
    let height: Int
    let weight: Int
}

extension Pokemon: Identifiable {
    
}

extension Pokemon: CustomDebugStringConvertible {
    var debugDescription: String {
        "Pokemon - \(id) - \(self.species.name)"
    }
}
