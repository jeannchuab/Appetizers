//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 23/02/24.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var userModel = UserModel()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !userModel.firstName.isEmpty,
              !userModel.lastName.isEmpty, !userModel.email.isEmpty
        else {
            alertItem = AlertContext.missingRequiredFields
            return false
        }
        
        guard userModel.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
    }
}
