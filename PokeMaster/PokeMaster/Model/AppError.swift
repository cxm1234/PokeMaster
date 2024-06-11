//
//  AppError.swift
//  PokeMaster
//
//  Created by ming on 2024/4/17.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }
    case passwordWrong
    case networingFailed(Error)
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong: return "密码错误"
        case .networingFailed(let error):
            return error.localizedDescription
        }
    }
}
