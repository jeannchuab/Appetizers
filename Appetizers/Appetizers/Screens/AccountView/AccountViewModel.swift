//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 23/02/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
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
        
        do {
            let data = try JSONEncoder().encode(userModel)
            userData = data
            alertItem = AlertContext.userSaveSucess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            userModel = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
