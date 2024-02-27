//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        //.listRowSeparator(.hidden)
                        .listRowSeparatorTint(Color.accentColor)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.isShowingDetail = true
                                viewModel.selectedAppetizer = appetizer
                            }
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            //            .onAppear { //Completion code
            //                self.viewModel.getAppetizers()
            //            }
            .task { //Async code
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer1,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    AppetizerListView( )
}
