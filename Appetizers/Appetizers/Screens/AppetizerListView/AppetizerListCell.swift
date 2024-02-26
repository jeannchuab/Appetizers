//
//  AppetizerItemView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var appetizer: AppetizerModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }            
            .frame(width: 100, height: 80)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                //                    .fontWeight(.regular) //Only available in iOS 16
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer1)
}
