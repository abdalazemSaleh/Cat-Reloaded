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
    let errorCode: Int?
    let message: String?
    let isCatian: Bool?
}
