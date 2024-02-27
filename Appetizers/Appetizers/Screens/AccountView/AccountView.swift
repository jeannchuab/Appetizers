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
                }
                
                Section("Requests") {
                    Toggle("Extra Napkings", isOn: $viewModel.userModel.extraNapkings)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.userModel.frequentRefills)
                }
                
                Button(action: {
                    viewModel.saveChanges()
                }, label: {
                    Text("Save changes")
                })
            }
            .navigationTitle("👨‍💼 Account")
        }
        .onAppear {
            viewModel.retrieveUser()
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
