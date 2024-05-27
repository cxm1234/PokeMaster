//
//  SettingView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/9.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var store: Store
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    
    var settings: AppState.Settings {
        store.appState.settings
    }
    
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
        .alert(item: settingsBinding.loginError) { error in
            Alert(title: Text(error.localizedDescription))
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            if settings.loginUser == nil {
                Picker(
                    selection: settingsBinding.checker.accountBehavior) {
                        ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
                            Text($0.text)
                        }
                    } label: {
                        Text("")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                
                TextField("电子邮箱", text: settingsBinding.checker.email)
                    .foregroundColor(settings.isEmailValid ? .green : .red)
                SecureField("密码", text: settingsBinding.checker.password)
                
                if settings.loginRequesting {
                    Text("登录中...")
                } else {
                    Button(settings.checker.accountBehavior.text) {
                        self.store.dispatch(
                            .login(
                                email: self.settings.checker.email,
                                password: self.settings.checker.password
                            )
                        )
                    }
                    if settings.checker.accountBehavior == .register {
                        SecureField("确认密码", text: settingsBinding.checker.verifyPassword)
                    }
                }
                

            } else {
                Text(settings.loginUser!.email)
                Button("注销") {
                    print("注销")
                }
            }
            
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            
            Toggle(isOn: settingsBinding.showEnglishName) {
                Text("显示英文名")
            }
            
            Picker(
                selection: settingsBinding.sorting) {
                    ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                        Text($0.text)
                    }
                } label: {
                    Text("排序方式")
                }
            
            Toggle(isOn: settingsBinding.showEnglishName) {
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

extension AppState.Settings.Sorting {
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

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登陆"
        }
    }
}
