//
//  GeneralExtension.swift
//  WpCrypto
//
//  Created by Murat Yazıcı on 18.02.2024.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static func slideTransition(edge: Edge) -> AnyTransition {
        let insertion = AnyTransition.move(edge: edge)
        let removal = AnyTransition.move(edge: edge)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Button {
     func standardBtn() -> some View {
        
        return self
             .frame(width: 100)
            .padding()
            .background(GeneralConstant.firstColor.opacity(GeneralConstant.secondOpacity))
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
         
    }
}

extension TextField {
    func setCustomBorder(color: Color) -> some View {
        return self
            .padding()
            .frame(width: .infinity, alignment: .center)
            .font(.title3)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(color, lineWidth: 4)
            })
    }
}

extension Text {
    func setCustomBorder(color: Color) -> some View {
        return self
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.title3)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(color, lineWidth: 4)
            })
    }
}
