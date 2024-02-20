//
//  TokenListView.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 17.02.2024.
//

import SwiftUI

struct TokenListView: View {
    @State var list: [TokenListItem]
    var body: some View {
        List{
            ForEach(list) { item in
                HStack {
                    Image(systemName: item.image)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.orange.opacity(0.8))
                        .shadow(radius: 2, y: 4)
                    
                    VStack(alignment: .leading) {
                        Text(item.symbol)
                        Text("\(item.amount.formatted(.number)) \(item.symbol)")
                    }
                    Spacer()
                    
                    Text("\((item.amount*30).formatted(.currency(code: "USD"))) USD")
                        .font(.system(size: 15))
                        .bold()
                }
            }
        }.listStyle(.inset)
        .onAppear{
            list = [TokenListItem(symbol: "BNB", amount: 0.0, image: "octagon.fill")]
            }
}
}

struct TokenListView_Previews: PreviewProvider {
    static var previews: some View {
        let list = [TokenListItem(symbol: "BNB", amount: 10.34, image: "octagon.fill")]
        TokenListView(list: list)
    }
}
