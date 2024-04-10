//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by ming on 2024/4/1.
//

import SwiftUI

struct PokemonInfoPanel: View {
    let model: PokemonViewModel
    
    @State var darkBlur = false
    
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            topIndicator
                .padding()
            
            Header(model: model)
            
            pokemonDescription
                .padding(.horizontal)
            
            Divider()
            
            AbilityList(
                model: model,
                abilityModels: abilities
            )

            Spacer()
        }
        .padding(
            EdgeInsets(top: 12, leading: 30, bottom: 30, trailing: 30)
        )
        .blurBackground(style: .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
        
    }
}

extension PokemonInfoPanel {
    struct Header: View {
        let model: PokemonViewModel
        var body: some View {
            HStack(spacing: 18) {
                pokemonIcon
                nameSpecies
                verticalDivider
                
                VStack(spacing: 12) {
                    bodyStatus
                    typeInfo
                }
            }
        }
        
        var pokemonIcon: some View {
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width: 68, height: 68)
        }
        
        var nameSpecies: some View {
            VStack(spacing: 10) {
                VStack {
                    Text(model.name)
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(model.color)
                    Text(model.nameEN)
                        .fontWeight(.bold)
                        .font(.system(size: 13))
                        .foregroundColor(model.color)
                }
                
                Text(model.genus)
                    .fontWeight(.bold)
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
            }
        }
        
        var verticalDivider: some View {
            Divider()
                .frame(height: 44)
                .background(Color.black)
                .opacity(0.1)
        }
        
        var bodyStatus: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("身高")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 11))
                    Text(model.height)
                        .foregroundColor(model.color)
                        .font(.system(size: 11))
                }
                HStack {
                    Text("体重")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 11))
                    Text(model.weight)
                        .foregroundColor(model.color)
                        .font(.system(size: 11))
                }
            }
        }
        
        var typeInfo: some View {
            HStack {
                ForEach(model.types) { type in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(type.color)
                        
                        Text(type.name)
                            .foregroundColor(Color.white)
                            .font(.system(size: 10))
                    }
                    .frame(width: 36, height: 14)
                }
            }
        }
    }
}

extension PokemonInfoPanel {
    var pokemonDescription: some View {
        VStack {
            Text(model.descriptionText)
                .font(.callout)
                .foregroundColor(Color(hex: 0x666666))
                .fixedSize(horizontal: false, vertical: true)
            Divider()
        }
    }
}

#Preview {
    PokemonInfoPanel(model: .sample(id: 1))
}
