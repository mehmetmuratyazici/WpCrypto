//
//  CryptoGeneral.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.01.2023.
//

import Foundation
import HDWalletKit

class CryptoGeneral {
    
    func createWallet(pass: String) -> CryptoWalletInfo {
        
        let mnemonic = Mnemonic.create()//(strength: Mnemonic.Strength.hight, language: WordList.english)
        return createWalletByMnemonic(mnemonic: mnemonic, pass: pass)
    }
    
    func createWalletByMnemonic(mnemonic: String, pass: String) -> CryptoWalletInfo {
        let seed = Mnemonic.createSeed(mnemonic: mnemonic, withPassphrase: pass)
        //Wallet(seed: seed, coin: .ethereum)
        print(mnemonic)
        //mnemonicTextView.text = mnemonic
        let privateKey = PrivateKey(seed: seed, coin: .ethereum)
        // BIP44 key derivation
        // m/44'
        let purpose = privateKey.derived(at: .hardened(32))

        // m/44'/0'
        let coinType = purpose.derived(at: .hardened(0))
        
        // m/44'/0'/0'
        let account = coinType.derived(at: .hardened(0))

        // m/44'/0'/0'/0
        let change = account.derived(at: .notHardened(0))

        // m/44'/0'/0'/0/0
        let firstPrivateKey = change.derived(at: .notHardened(0))
        //get private key
        print(firstPrivateKey.get())
        
        print(firstPrivateKey.publicKey.address)
        return CryptoWalletInfo(privateKey: firstPrivateKey.get(), address: firstPrivateKey.publicKey.address, mnemonic: mnemonic)
    }
    
    func importWithPirvateKey(pKey: String, coin: Coin) {
        let privateKey = PrivateKey(pk: pKey, coin: coin)
        print(privateKey?.publicKey.address)
    }
    
    func generateKeyList(chunkSize: Int, keys: [String]) -> [[String]] {
        return stride(from: 0, to: keys.count, by: chunkSize).map {
            Array(keys[$0..<min($0 + chunkSize, keys.count)])
        }
    }
}
