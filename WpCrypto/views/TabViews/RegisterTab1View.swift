//
//  RegisterTab2View.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 14.02.2024.
//

import SwiftUI

struct RegisterTab1View: View {
    @ObservedObject var loginInfo: LoginViewModel
    @State private var degree = 0
    var body: some View {
        VStack {
            Text(GeneralConstant.appName)
                .font(.title)
                .edgesIgnoringSafeArea(.leading)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 10)
            Spacer()
            Image(GeneralConstant.appLogo)
                .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300) // İhtiyaca göre boyutları ayarlayabilirsiniz.
                            .padding()
                            .rotationEffect(.degrees(Double(degree)))
                            .rotation3DEffect(.degrees(Double(degree)), axis: (x: 40, y: 30, z: 30))
                            .animation(.easeInOut(duration: 1.5))
                            .onAppear{
                                degree = 360
                            }
                            .onDisappear{
                                degree = 0
                            }                        .shadow(color: Color.gray, radius: 5, x: 0, y: 10)

            
            Spacer()
            SecureField("Password", text: $loginInfo.password)
                .padding()
                .frame(height: 80)
                .font(.system(size: 20))
                .keyboardType(.default)
                .background(GeneralConstant.firstColor.opacity(GeneralConstant.firstOpacity))
                .cornerRadius(10)
                .padding(EdgeInsets.init(top: 5, leading: 20, bottom: 5, trailing: 20))
            
            
        }
    }
}

