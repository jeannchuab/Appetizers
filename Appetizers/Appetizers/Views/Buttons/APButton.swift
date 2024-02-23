//
//  APButton.swift
//  Appetizers
//
//  Created by Jeann Luiz on 22/02/24.
//

import SwiftUI

struct APButton: View {
    
    var price: LocalizedStringKey
    
    var body: some View {
        Text(price)
            .font(.title2)
            .frame(width: 260, height: 50)
//                    .fontWeight(.semibold) //iOS 16 or newer
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(price: "$\(MockData.sampleAppetizer.price, specifier: "%.2f") - Add to order")
}
