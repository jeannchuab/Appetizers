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
                Section(content: {
                    TextField("First name", text: $viewModel.textFieldFirstName)
                        .autocorrectionDisabled(false)
                        
                    TextField("Last name", text: $viewModel.textFieldLastName)
                        .autocorrectionDisabled(false)
                    
                    TextField("Email", text: $viewModel.textFieldEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(false)
                                                            
                    DatePicker("Birthday", selection: $viewModel.textFieldBirthday,
                               displayedComponents: .date)
                                        
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save changes")
                    })
                    .tint(Color.brandPrimary)
                    
                }, header: { 
                    Text("Personal Info")
                })
                
                Section(content: {
                    Toggle("Extra Napkings", isOn: $viewModel.toggleExtraNapkings)
//                         .tint(Color.brandPrimary)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.toggleFrequentRefills)
//                        .tint(Color.brandPrimary)
                    
                }, header: {
                    Text("Requests")
                })
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
