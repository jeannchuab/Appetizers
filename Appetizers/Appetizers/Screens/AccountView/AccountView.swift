//
//  AccountView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @State private var textFieldFirstName = ""
    @State private var textFieldLastName = ""
    @State private var textFieldEmail = ""
    @State private var textFieldBirthday = Date()
    @State private var toggleExtraNapkings = false
    @State private var toggleFrequentRefills = false
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(content: {
                    TextField("First name", text: $textFieldFirstName)
                        .autocorrectionDisabled(false)
                        
                    TextField("Last name", text: $textFieldLastName)
                        .autocorrectionDisabled(false)
                    
                    TextField("Email", text: $textFieldEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(false)
                                                            
                    DatePicker("Birthday", selection: $textFieldBirthday,
                               displayedComponents: .date)
                                        
                    Button(action: {
                        print("Click buton")
                    }, label: {
                        Text("Save changes")
                    })
                    .tint(Color.brandPrimary)
                    
                }, header: { 
                    Text("Personal Info")
                })
                
                Section(content: {
                    Toggle("Extra Napkings", isOn: $toggleExtraNapkings)
//                         .tint(Color.brandPrimary)
                        
                    Toggle("Frequent Refills", isOn: $toggleFrequentRefills)
//                        .tint(Color.brandPrimary)
                    
                }, header: {
                    Text("Requests")
                })
                .tint(Color.brandPrimary)
            }
            .navigationTitle("👨‍💼 Account")
        }
    }
}

#Preview {
    AccountView()
}
