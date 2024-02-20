//
//  LoginView.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 15.02.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var goToWalletHomePage = false
    @State var showLoginAlert = false
    @Binding var walletInfo : CryptoWalletInfo
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            List {
                ForEach(loginViewModel.loginKeyValues.indices
                        , id: \.self) { index in
                    
                    if(index % 2 == 0) {
                        HStack{
                            TextField("Word \(index + 1)", text: Binding(
                                get: { loginViewModel.loginKeyValues[index] },
                                set: { loginViewModel.loginKeyValues[index] = $0 }
                                                    ))
                            .setCustomBorder(color: GeneralConstant.secondColor.opacity(GeneralConstant.firstOpacity))
                            Spacer()
                            TextField("Word \(index + 2)", text: Binding(
                                get: { loginViewModel.loginKeyValues[index+1] },
                                set: { loginViewModel.loginKeyValues[index+1] = $0 }
                                                    ))
                            .setCustomBorder(color: GeneralConstant.firstColor.opacity(GeneralConstant.firstOpacity))
                        }
                    }
                }
            }.listStyle(.inset)
            Button("Log In") {
                
                if !loginViewModel.loginKeyValues.contains("") {
                    walletInfo = CryptoGeneral().createWalletByMnemonic(mnemonic: loginViewModel.loginKeyValues.joined(separator: " "), pass: loginViewModel.password)
                    print(walletInfo)
                    withAnimation {
                        goToWalletHomePage = true
                    }
                }
                else {
                    showLoginAlert.toggle()
                }
                
            }
            .standardBtn()
            .fullScreenCover(isPresented: $goToWalletHomePage){
                WalletHomeView(walletInfo: $walletInfo)
            }.alert(isPresented: $showLoginAlert) {
                Alert(title: Text("Message").font(.title), message: Text("Have to fill all fields").font(.body), dismissButton: .default(Text("Ok")){
                    // Alert'ten çıkıldığında sayfanın nereye gitmesini istiyorsanız burada belirtebilirsiniz.
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        var loginViewModel = LoginViewModel()
        var walletInfo = Binding.constant(CryptoWalletInfo(privateKey: "", address: "", mnemonic: ""))
        LoginView(loginViewModel: loginViewModel, walletInfo: walletInfo)
    }
}
