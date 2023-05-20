//
//  LoginModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

struct User: Codable {
    let id: String?
    let fullName : String?
    let email: String?
    let phoneNumber: String?
    let isCatian: Bool?
    let title: String?
    let imageUrl: String?
    let techCircle: String?
    let techRole: String?
    let nonTechCircle: String?
    let nonTechRole: String?
    let generation: String?
    let token: String?
    let error: String?
    let errorCode: Int?
}

struct  loginParms {
    let phone: String
    let password: String
}
