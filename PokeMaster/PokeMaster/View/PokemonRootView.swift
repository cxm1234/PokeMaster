//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/16.
//

import SwiftUI

struct PokemonRootView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        NavigationView {
            if store.appState.pokemonList.pokemons == nil {
                Text("Loading").onAppear {
                    self.store.dispatch(.loadPokemons)
                }
            } else {
                PokemonList()
                    .navigationBarTitle("宝可梦列表")
            }
        }
    }
}

#Preview {
    PokemonRootView()
}
