//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 23/02/24.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var textFieldFirstName = ""
    @Published var textFieldLastName = ""
    @Published var textFieldEmail = ""
    @Published var textFieldBirthday = Date()
    @Published var toggleExtraNapkings = false
    @Published var toggleFrequentRefills = false
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !textFieldFirstName.isEmpty,
              !textFieldLastName.isEmpty, !textFieldEmail.isEmpty
        else {
            alertItem = AlertContext.missingRequiredFields
            return false
        }
        
        guard textFieldEmail.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
    }
}
