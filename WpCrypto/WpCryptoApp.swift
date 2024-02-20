//
//  WpCryptoApp.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.01.2023.
//

import SwiftUI

@main
struct WpCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            LoginRegisterView(loginViewModel: LoginViewModel())
        }
    }
}
