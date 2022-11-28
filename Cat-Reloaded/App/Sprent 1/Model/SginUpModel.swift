//
//  SginUpModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

struct SignUpModel: Codable {
    let token: String?
    let id: String?
    let fullName : String?
    let email: String?
    let phoneNumber: String?
    let error: String?
    let errorCode: Int?
}

struct signUpParms {
    let fullName: String
    let email: String
    let phonNumber: String
    let password: String
    let passwordConfirmation: String
}


// Sign up with facebook & google model
struct ExternalSignUpModel: Codable {
    let token: String?
    let id: String?
    let fullName : String?
    let email: String?
    let phoneNumber: String?
    let errorCode: Int?
    let message: String?
}

