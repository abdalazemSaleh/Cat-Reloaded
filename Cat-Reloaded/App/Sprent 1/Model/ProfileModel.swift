//
//  ProfileModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-30.
//

import Foundation

// Profile Model
// Using in : - Login, SignUp, External signUp
struct ProfileModel: Codable {
    let token: String?
    let id: String?
    let fullName : String?
    let email: String?
    let phoneNumber: String?
    let error: String?
    let errorCode: Int?
}

//// Login Parms
//struct  loginParms {
//    let phone: String
//    let password: String
//}
//// Sign up Parms
//struct signUpParms {
//    let fullName: String
//    let email: String
//    let phonNumber: String
//    let password: String
//    let passwordConfirmation: String
//}
