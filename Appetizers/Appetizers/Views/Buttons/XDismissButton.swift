//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Jeann Luiz on 22/02/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.8)
            
            Image(systemName: "xmark")
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
