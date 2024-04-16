//
//  SettingRootView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/9.
//

import SwiftUI

struct SettingRootView: View {
    var body: some View {
        NavigationView {
            SettingView().navigationTitle("设置")
        }
    }
}

#Preview {
    SettingRootView()
}
