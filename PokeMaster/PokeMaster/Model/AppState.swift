//
//  AppState.swift
//  PokeMaster
//
//  Created by ming on 2024/4/16.
//

import Foundation
import Combine

struct AppState {
    var settings = Settings()
    var pokemonList = PokemonList()
}

extension AppState {
    
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        
        var showEnglishName = true
        var sorting = Sorting.id
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        class AccountChecker {
            @Published var accountBehavior = AccountBehavior.login
            @Published var email = ""
            @Published var password = ""
            @Published var verifyPassword = ""
            
            var isEmailValid: AnyPublisher<Bool, Never> {
                let remoteVerify = $email
                    .debounce(
                        for: .milliseconds(500),
                        scheduler: DispatchQueue.main
                    )
                    .removeDuplicates()
                    .flatMap { email -> AnyPublisher<Bool, Never> in
                        let validEmail = email.isValidEmailAddress
                        let canSkip = self.accountBehavior == .login
                        
                        switch (validEmail, canSkip) {
                        case (false, _):
                            return Just(false).eraseToAnyPublisher()
                        case (true, false):
                            return EmailCheckingRequest(email: email)
                                .publisher
                                .eraseToAnyPublisher()
                        case (true, true):
                            return Just(true).eraseToAnyPublisher()
                        }
                    }
                let emailLocalValid = $email.map { $0.isValidEmailAddress }
                let canSkipRemoteVerify = $accountBehavior.map {
                    $0 == .login
                }
                return Publishers.CombineLatest3(emailLocalValid, canSkipRemoteVerify, remoteVerify)
                    .map {
                        $0 && ($1 || $2)
                    }
                    .eraseToAnyPublisher()
            }
        }
        
        var checker = AccountChecker()
        
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        var loginRequesting: Bool = false
        var loginError: AppError?
        
        var isEmailValid: Bool = false 
    }
    
    struct PokemonList {
        var pokemons: [Int: PokemonViewModel]?
        var loadingPokemons = false
        
        var allPokemonsByID: [PokemonViewModel] {
            guard let pokemons = pokemons?.values else {
                return []
            }
            return pokemons.sorted { $0.id < $1.id }
        }
    }
    
}
