//
//  WalletHomeView.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 15.02.2024.
//

import SwiftUI

struct WalletHomeView: View {
    @State private var selectedTab = 0
    @State var tokenList : [TokenListItem] = []
    @Binding var walletInfo: CryptoWalletInfo
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "seal.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(GeneralConstant.firstColor)
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.leading)
                Text("Account 1")
                Image(systemName: "chevron.down")
            }.shadow(color: Color.gray, radius: 5, x: 0, y: 5)

            
            
            VStack{
                HStack{
                    Text("\(walletInfo.address)")
                        .frame(width: 150)
                        .lineLimit(1)
                        .font(Font.subheadline)
                      
                    Image(systemName: "doc.on.doc.fill")
                }.padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(GeneralConstant.firstColor.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(50)
                                    .offset(y: 10)
                Text("0 BNB")
                    .font(.largeTitle)
                    .offset(y: 10)
                
                //total amount
                Text("$0 USD")
                    .font(.system(size: 20))
                    .offset(y: 10)
                
                HStack {
                    VStack {
                        
                        Image(systemName: "plus.forwardslash.minus")
                            .padding(10)
                            .font(.title2)
                            .bold()
                            .background(GeneralConstant.firstColor.opacity(GeneralConstant.secondOpacity))
                            .foregroundColor(.white)
                            .cornerRadius(50)
                        Text("Buy & Sell")
                            .font(.system(size: 15))
                    }
                    VStack {
                        
                        Image(systemName: "paperplane.fill")
                            .padding(10)
                            .font(.title2)
                            .background(GeneralConstant.firstColor.opacity(GeneralConstant.secondOpacity))
                            .foregroundColor(.white)
                            .cornerRadius(50)
                        Text("Send")
                            .font(.system(size: 15))
                    }
                    VStack {
                        
                        Image(systemName: "arrow.triangle.swap")
                            .padding(10)
                            .font(.title2)
                            .background(GeneralConstant.firstColor.opacity(GeneralConstant.secondOpacity))
                            .foregroundColor(.white)
                            .cornerRadius(50)
                        Text("Swap")
                            .font(.system(size: 15))
                    }
                }.padding()
                
                VStack {
                            Picker(selection: $selectedTab, label: Text("")) {
                                Text("Tokenler").tag(0)
                                Text("NTF'ler").tag(1)
                                Text("Etkinlik").tag(2)
                            }
                            .pickerStyle(.segmented)
                    
                            TabView(selection: $selectedTab) {
                                TokenListView(list: tokenList)
                                    .tag(0)
                                Text("Mevcut değil")
                                    .tag(1)
                                Text("Mevcut değil")
                                    .tag(2)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            
            
        }
    
    }
}

struct WalletHomeView_Previews: PreviewProvider {
    static var previews: some View {
        var walletInfo = Binding.constant(CryptoWalletInfo(privateKey: "", address: "", mnemonic: ""))
        WalletHomeView(walletInfo: walletInfo)
    }
}
