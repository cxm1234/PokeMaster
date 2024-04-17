//
//  AppState.swift
//  PokeMaster
//
//  Created by ming on 2024/4/16.
//

import Foundation

struct AppState {
    var settings = Settings()
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
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        var loginRequesting: Bool = false
        var loginError: AppError?
    }
    
}
