//
//  ContentView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    //We can use a Text and Image
                    //Image(systemName: "house")
                    //Text("Home")
                    
                    //Or a label
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(orderViewModel.appetizers.count)                
        }
    }
}

#Preview {
    AppetizersTabView()
}
