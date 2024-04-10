//
//  PokemonInfoPanelAbilityList.swift
//  PokeMaster
//
//  Created by ming on 2024/4/3.
//

import SwiftUI

extension PokemonInfoPanel {
    struct AbilityList: View {
        let model: PokemonViewModel
        let abilityModels: [AbilityViewModel]?
        
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("技能")
                    .font(.headline)
                    .fontWeight(.bold)
                if let abilityModels {
                    ForEach(abilityModels) { ability in
                        Text(ability.name)
                            .font(.subheadline)
                            .foregroundColor(self.model.color)
                        Text(ability.descriptionText)
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0xAAAAAA))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//struct PokemonInfoPanelAbilityList: View {
//    let model: PokemonViewModel
//    let abilityModels: [AbilityViewModel]?
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("技能")
//                .font(.headline)
//                .fontWeight(.bold)
//            
//            if let abilityModels {
//                ForEach(abilityModels) { ability in
//                    Text(ability.name)
//                        .font(.subheadline)
//                        .foregroundColor(self.model.color)
//                    Text(ability.descriptionText)
//                        .font(.footnote)
//                        .foregroundColor(Color(hex: 0xaaaaaa))
//                        .fixedSize(horizontal: false, vertical: true)
//                }
//            }
//        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//    }
//}
//
//#Preview {
//    PokemonInfoPanelAbilityList(
//        model: PokemonViewModel.sample(id: 1),
//        abilityModels: AbilityViewModel.sample(pokemonID: 1)
//    )
//}
