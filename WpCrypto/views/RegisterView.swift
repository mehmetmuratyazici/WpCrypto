//
//  RegisterView.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.02.2024.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @Binding var currentIndex: Int
    @State private var tabIndex = 0
    @State var isPasswordNull = false
    @State var showWalletHomePage = false
    @Binding var showParentTabButtons :Bool
    @State var loginTabIndex = 0
    @State var walletInfo : CryptoWalletInfo = CryptoWalletInfo(privateKey: "", address: "", mnemonic: "")
    var body: some View {
        VStack {
           
            TabView(selection: $tabIndex) {
                RegisterTab1View(loginInfo: loginViewModel).tag(0)
                    .transition(.slideTransition(edge: .top))
                RegisterTab2View(loginInfo: loginViewModel, walletInfo: $walletInfo).tag(1)
            }.tabViewStyle(.automatic)
            
            HStack {
               
                if tabIndex == 1 {
                    Button("back") {
                        
                        withAnimation {
                            tabIndex -= 1
                            showParentTabButtons = true
                        }
                        
                        
                    }
                    .standardBtn()
                    
                    
                }
               
                   Button("continue") {
                       if loginViewModel.password == "" {
                           isPasswordNull = true
                       }
                       else if tabIndex == 1 {
                           showWalletHomePage = true
                       }
                       else {
                           withAnimation {
                               tabIndex += 1
                               showParentTabButtons = false
                           }
                       }
                       
                   }
                   .standardBtn()
                   .fullScreenCover(isPresented: $showWalletHomePage){
                       WalletHomeView(walletInfo: $walletInfo)
                   }
                   .alert(isPresented: $isPasswordNull) {
                       Alert(title: Text("Warning Message"), message: Text("have to fill password field"), dismissButton: .cancel(Text("Ok")))
                   }
               
           }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView( loginViewModel: LoginViewModel(), currentIndex: Binding.constant(1), showParentTabButtons: Binding.constant(true))
    }
}
