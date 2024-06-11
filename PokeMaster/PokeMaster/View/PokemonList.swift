//
//  PokemonList.swift
//  PokeMaster
//
//  Created by ming on 2024/3/28.
//

import SwiftUI

struct PokemonList: View {
    @EnvironmentObject var store: Store
    
    @State var expandingIndex: Int?
    @State var searchContent: String = ""
    
    var body: some View {
        ScrollView {
            ForEach(store.appState.pokemonList.allPokemonsByID) { pokemon in
                PokemonInfoRow(
                    model: pokemon,
                    expanded: self.expandingIndex == pokemon.id)
                .onTapGesture {
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)) {
                        if self.expandingIndex == pokemon.id {
                            self.expandingIndex = nil
                        } else {
                            self.expandingIndex = pokemon.id
                        }
                    }
                }
            }
        }
//        .overlay(
//            VStack {
//                Spacer()
//                PokemonInfoPanel(model: .sample(id: 1))
//            }.edgesIgnoringSafeArea(.bottom)
//        )
    }
}

extension PokemonList {
    var SearchControl: some View {
        ZStack {
            TextField("搜索宝可梦", text: $searchContent)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .font(.system(size: 14))
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    Color.init(hex: 000000, alpha: 0.2),
                    style: StrokeStyle(lineWidth: 0.5)
                )
        }
        .padding(.horizontal)
    }
}

#Preview {
    PokemonList()
}
