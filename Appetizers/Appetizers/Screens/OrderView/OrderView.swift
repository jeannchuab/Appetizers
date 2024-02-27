//
//  OrderView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

//TODO: Show duplicate items as a same item with a quantity field, like x2, x3.

struct OrderView: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderViewModel.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            withAnimation(.easeInOut) {
                                orderViewModel.remove(at: indexSet)
                            }
                        }
                    }
                    .navigationTitle("🛒 Orders")
                    .listStyle(.plain)
                    
                    Button {
                        print("Place order")
                    } label: {
                        APButton(price: "$\(orderViewModel.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .padding(.bottom)
                }
                                    
                if orderViewModel.appetizers.isEmpty {
                EmptyListState(imageName: "empty-order", message: "You have no items in your order ☹️\nPlease add an appetizer. 🌮")
                        .transition(.scale)
                }
            }            
        }
    }
}

#Preview {
    OrderView()
}
