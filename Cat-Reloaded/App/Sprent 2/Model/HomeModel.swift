//
//  HomeModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

struct HomeModel: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data : [HomeData]
}

struct HomeData: Codable, Hashable {
    let id: Int?
    let description: String?
    let imageUrl: String?
    let thumbnailUrl: String?
    let episodeUrl: String?
}
