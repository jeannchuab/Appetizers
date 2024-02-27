//
//  EmptyListState.swift
//  Appetizers
//
//  Created by Jeann Luiz on 26/02/24.
//

import SwiftUI

struct EmptyListState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit() 
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()                    
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyListState(imageName: "empty-order", message: "Default message.\nThat's a second phrase just to test a long message")
}
