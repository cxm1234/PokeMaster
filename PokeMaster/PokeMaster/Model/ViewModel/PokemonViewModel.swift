//
//  PokemonViewModel.swift
//  PokeMaster
//
//  Created by ming on 2024/3/28.
//

import SwiftUI

struct PokemonViewModel: Identifiable, Codable {
    var id: Int {
        pokemon.id
    }
    
    let pokemon: Pokemon
    let species: PokemonSpecies
    
    init(pokemon: Pokemon, species: PokemonSpecies) {
        self.pokemon = pokemon
        self.species = species
    }
    
    var color: Color { species.color.name.color }
    var height: String { "\(Double(pokemon.height) / 10)m" }
    var weight: String { "\(Double(pokemon.weight) / 10)kg" }
    var name: String { species.names.CN }
    var nameEN: String { species.names.EN }
    var genus: String { species.genera.CN }
    var genusEN: String { species.genera.EN }
    
    var types: [Type] {
        self.pokemon.types
            .sorted { $0.slot < $1.slot }
            .map { Type()}
    }
}

extension PokemonViewModel {
    
}


