//
//  AppAction.swift
//  PokeMaster
//
//  Created by ming on 2024/4/17.
//

import Foundation

enum AppAction {
    case login(email: String, password: String)
    case accountBehaviorDone(result: Result<User, AppError>)
    case emailValid(valid: Bool)
    case loadPokemons
    case loadPokemonsDone(result: Result<[PokemonViewModel], AppError>)
}

