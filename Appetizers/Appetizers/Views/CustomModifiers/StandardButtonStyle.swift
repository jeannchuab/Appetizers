//
//  StandardButtonStyle.swift
//  Appetizers
//
//  Created by Jeann Luiz on 27/02/24.
//

import SwiftUI

//Example of use: .modifier(StandardButtonStyle())
struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color.accentColor)
            .controlSize(.large)
    }
}

//That a second way to use the modifier: .standardButtonStyle()
extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
