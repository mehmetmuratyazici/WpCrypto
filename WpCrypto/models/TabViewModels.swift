//
//  TabViewModels.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.02.2024.
//

import Foundation

class Tab1ViewModel: ObservableObject {
    @Published var dataForTab1: String = "Veri Sekme 1"
}

class Tab2ViewModel: ObservableObject {
    @Published var dataForTab2: String = "Veri Sekme 2"
}

class Tab3ViewModel: ObservableObject {
    @Published var dataForTab3: String = "Veri Sekme 3"
}

class LoginViewModel: ObservableObject {
    @Published var loginKeyValues: [String] = Array(repeating: "", count: 12)
    @Published var password : String = ""
}
