//
//  LoginRegisterView.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 18.02.2024.
//

import SwiftUI

struct LoginRegisterView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State private var currentIndex: Int = 0
    @State var isPasswordNull = false
    @State var showWalletHomePage = false
    @State var showParentTabButtons = true
    @State var loginTabIndex = 0
    @State var walletInfo : CryptoWalletInfo = CryptoWalletInfo(privateKey: "", address: "", mnemonic: "")
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                LoginTabView(loginViewModel: loginViewModel, currentIndex: $currentIndex, tabIndex: $loginTabIndex, walletInfo: $walletInfo, showParentTabButtons: $showParentTabButtons).tag(0)
                    
                RegisterView(loginViewModel: loginViewModel, currentIndex: $currentIndex, showParentTabButtons: $showParentTabButtons).tag(1)
            }
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut)
            
            if showParentTabButtons {
                HStack {
                    if currentIndex == 1 {
                        Button("Log In") {
                            
                            withAnimation {
                                currentIndex -= 1
                            }
                        }
                        .padding()
                    }
                    else if currentIndex == 0 {
                        Button( "Register Now" ) {
                            
                            withAnimation {
                                currentIndex += 1
                            }
                            
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView(loginViewModel: LoginViewModel())
    }
}
