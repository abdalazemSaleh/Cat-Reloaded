//
//  SginUpModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

struct SignUpModel: Codable {
//    let errorCode: Int?
//    let error: String?
}

struct signUpParms {
    let fullName: String
    let email: String
    let phonNumber: String
    let password: String
    let passwordConfirmation: String
}
