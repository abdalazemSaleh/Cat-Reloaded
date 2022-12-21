//
//  AboutCatModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-21.
//

import Foundation


struct AboutCatInfoModel: Hashable, Codable {
    let about: String
    let history: String
    let vision: String
}

struct AboutCatModel: Hashable, Codable {
    let id: String?
    let name: String?
    let title: String?
    let imageUrl: String?
    let facebookUrl: String?
    let githubUrl: String?
    let linkedInUrl: String?
    let twitterUrl: String?
}
