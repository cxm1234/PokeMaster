//
//  PokeMasterApp.swift
//  PokeMaster
//
//  Created by ming on 2024/3/19.
//

import SwiftUI

@main
struct PokeMasterApp: App {
    var body: some Scene {
        WindowGroup {
            MainTab().environmentObject(Store())
        }
    }
}
