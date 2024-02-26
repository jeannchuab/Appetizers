//
//  AccountView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {            
            Form {
                Section("Notes") {
                    TextField("Placeholder text", text: $viewModel.userModel.firstName)
                }

                Section("Personal Info") {
                
                    TextField("First name", text: $viewModel.userModel.firstName)
                        .autocorrectionDisabled(false)
                        
                    TextField("Last name", text: $viewModel.userModel.lastName)
                        .autocorrectionDisabled(false)
                    
                    TextField("Email", text: $viewModel.userModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(false)
                                                            
                    DatePicker("Birthday", selection: $viewModel.userModel.birthday,
                               displayedComponents: .date)
                                        
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save changes")
                    })
                    .tint(Color.brandPrimary)
                }
                
                Section("Requests") {
                    Toggle("Extra Napkings", isOn: $viewModel.userModel.extraNapkings)
//                         .tint(Color.brandPrimary)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.userModel.frequentRefills)
//                        .tint(Color.brandPrimary)
                    
                }
                .tint(Color.brandPrimary)
            }
            .navigationTitle("👨‍💼 Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
