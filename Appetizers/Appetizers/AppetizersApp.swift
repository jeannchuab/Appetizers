//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var orderViewModel = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView()
                .environmentObject(orderViewModel)
        }
    }
}
