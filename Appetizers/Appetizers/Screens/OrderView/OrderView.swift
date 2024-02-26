//
//  OrderView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete { indexSet in
                        deleteItems(at: indexSet)
                    }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetail)
                .listStyle(.plain)
            }
            .onAppear {
                self.viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            Button {
                print("Place order")
            } label: {
                APButton(price: "$\(MockData.sampleAppetizer1.price, specifier: "%.2f") - Place order")
            }
            .padding(.bottom)
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
    func deleteItems(at indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}

#Preview {
    OrderView()
}
