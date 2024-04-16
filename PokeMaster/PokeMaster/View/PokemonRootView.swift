//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/16.
//

import SwiftUI

struct PokemonRootView: View {
    var body: some View {
        NavigationView {
            PokemonList().navigationBarTitle("宝可梦列表")
        }
    }
}

#Preview {
    PokemonRootView()
}
