//
//  AccountView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {            
            Form {
                Section("Personal Info") {
                    TextField("First name", text: $viewModel.userModel.firstName)
                        .autocorrectionDisabled(false)
                        .focused($focusedTextField, equals: .firstName)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        
                    TextField("Last name", text: $viewModel.userModel.lastName)
                        .autocorrectionDisabled(false)
                        .focused($focusedTextField, equals: .lastName)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .email
                        }
                    
                    TextField("Email", text: $viewModel.userModel.email)
                        .autocorrectionDisabled(false)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)                        
                        .focused($focusedTextField, equals: .email)
                        .submitLabel(.continue)
                        .onSubmit {
                            focusedTextField = nil //Dismiss keyboard
                        }
                                                            
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) { //Adding a toolbar to the keyboard
                    HStack {
                        Spacer()
                        Button("Dismiss") {
                            focusedTextField = nil
                        }
                    }                    
                }
            }
            
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
