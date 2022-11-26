//
//  LoginModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

// Login by phone
struct LoginModel: Codable {
    let token: String?
    let id: String?
    let fullName : String?
    let email: String?
    let phoneNumber: String?
    let error: String?
    let errorCode: Int?
}

struct  loginParms {
    let phone: String
    let password: String
}



