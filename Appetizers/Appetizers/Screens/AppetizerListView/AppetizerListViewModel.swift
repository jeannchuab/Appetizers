//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import Foundation

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [AppetizerModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: AppetizerModel?
    
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
    
    func getAppetizersAsync() {
        
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizersAsync()
                isLoading = false
            } catch APError.invalidUrl {
                alertItem = AlertContext.invalidUrl
            } catch APError.invalidResponse {
                alertItem = AlertContext.invalidResponse
            } catch APError.invalidData {
                alertItem = AlertContext.invalidData
            } catch APError.unableToComplete {
                alertItem = AlertContext.unableToComplete
            } catch {
                alertItem = AlertContext.unableToComplete
            }
        }
    }
}
