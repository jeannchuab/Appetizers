//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAppetizers() {
        
        isLoading = true
        
        NetworkManager.shared.getAppetizers { [weak self] result in
            DispatchQueue.main.async {
                
                self?.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidUrl:
                        self?.alertItem = AlertContext.invalidUrl
                        
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self?.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
