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
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidUrl:
                        alertItem = AlertContext.invalidUrl
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
