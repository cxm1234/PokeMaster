//
//  LoadPokemonRequest.swift
//  PokeMaster
//
//  Created by ming on 2024/5/26.
//

import Foundation
import Combine

struct LoadPokemonRequest {
    
    let id: Int
    
    func pokemonPublisher(_ id: Int) -> AnyPublisher<Pokemon, Error> {
        URLSession.shared
            .dataTaskPublisher(
                for: URL(string: "“https://pokeapi.co/api/v2/pokemon/\(id)")!
            )
            .map { $0.data }
            .decode(type: Pokemon.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
    
//    func spe
    
}
