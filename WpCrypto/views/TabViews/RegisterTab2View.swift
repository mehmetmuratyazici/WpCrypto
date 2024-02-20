//
//  RegisterTab3View.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.02.2024.
//

import SwiftUI

struct RegisterTab2View: View {
    
    @ObservedObject var loginInfo: LoginViewModel
    @State var mKeys : [[String]] = []
    @Binding var walletInfo : CryptoWalletInfo
    var body: some View {
        VStack(alignment: .center) {
            Text("Please take a screenshot because need it when want to login your account !!!")
                .bold()
                .padding()
            List {
                ForEach(mKeys
                        , id: \.self) { key in
                    HStack{
                        Text(key[0])
                            .setCustomBorder(color: GeneralConstant.firstColor.opacity(GeneralConstant.firstOpacity))
                        Text(key[1])
                            .setCustomBorder(color: GeneralConstant.firstColor.opacity(GeneralConstant.firstOpacity))
                    }
                }
            }.listStyle(.inset)
            .onAppear{
                walletInfo = CryptoGeneral().createWallet(pass: loginInfo.password)
                let _mKeys = walletInfo.mnemonic.split(separator: " ").map(String.init)
                let chunkSize = 2
                mKeys = stride(from: 0, to: _mKeys.count, by: chunkSize).map {
                    Array(_mKeys[$0..<min($0 + chunkSize, _mKeys.count)])
                }
            }
            
        }
    }
}

struct RegisterTab2View_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTab2View(loginInfo: LoginViewModel(), walletInfo: Binding.constant(CryptoWalletInfo(privateKey: "", address: "", mnemonic: "iron always mechanic crystal exhibit stomach resemble happy nation abandon cat pipe")))
    }
}


