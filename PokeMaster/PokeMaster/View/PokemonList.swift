//
//  PokemonList.swift
//  PokeMaster
//
//  Created by ming on 2024/3/28.
//

import SwiftUI

struct PokemonList: View {
    
    @State var expandingIndex: Int?
    @State var searchContent: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchControl
                
                ForEach(PokemonViewModel.all) { pokemon in
                    
                }
            }
        }
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
