//
//  SettingView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/9.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settings = Settings()
    
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(
                selection: $settings.accountBehavior) {
                    ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                        Text($0.text)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(SegmentedPickerStyle())
            
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            
            Button(settings.accountBehavior.text) {
                print("登陆/注册")
            }
            
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            
            Toggle(isOn: $settings.showEnglishName) {
                Text("显示英文名")
            }
            
            Picker(
                selection: $settings.soring) {
                    ForEach(Settings.Sorting.allCases, id: \.self) {
                        Text($0.text)
                    }
                } label: {
                    Text("排序方式")
                }
            
            Toggle(isOn: $settings.showFavoriteOnly) {
                Text("只显示收藏")
            }

        }
    }
    
    var actionSection: some View {
        Section(header: Text("")) {
            Button(action: {
                
            }) {
                Text("清空缓存")
                    .foregroundColor(Color.red)
            }
        }
    }
}

#Preview {
    SettingView()
}

class Settings : ObservableObject {
    enum AccountBehavior: CaseIterable {
        case register, login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color,favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    
    @Published var showEnglishName = true
    @Published var soring = Sorting.id
    @Published var showFavoriteOnly = false
    
}

extension Settings.Sorting {
    var text: String {
        switch self {
        case .id:
            return "ID"
        case .name:
            return "名字"
        case .color:
            return "颜色"
        case .favorite:
            return "最爱"
        }
    }
}

extension Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登陆"
        }
    }
}
