//
//  User.swift
//  Appetizers
//
//  Created by Jeann Luiz on 23/02/24.
//

import Foundation

struct UserModel: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNapkings: Bool = false
    var frequentRefills: Bool = false
}
