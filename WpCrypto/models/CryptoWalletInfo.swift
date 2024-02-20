//
//  CryptoWalletInfo.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.01.2023.
//

import Foundation

struct CryptoWalletInfo : Identifiable{
    var privateKey: String
    var address: String
    var mnemonic: String
    
    var id: String = UUID().uuidString
}
