//
//  TokenListItem.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 17.02.2024.
//

import Foundation

struct TokenListItem : Identifiable{
    var symbol : String
    var amount : Double
    var image : String
    
    var id: String = UUID().uuidString
}
