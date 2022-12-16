//
//  HomeModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

struct MainHomeModel: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data : [MainData]
}

struct MainData: Codable, Hashable {
    let id: Int?
    let description: String?
    let imageUrl: String?
    let thumbnailUrl: String?
    let episodeUrl: String?
}

struct Memories: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data: [MemoriesData]
}

struct MemoriesData: Codable, Hashable {
    let id: Int
    let description: String
    let imageUrl: String
    let thumbnailUrl: String
}

struct PodCat: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data: [PodCatData]
}

struct PodCatData: Codable, Hashable {
    let id: Int
    let title: String
    let thumbnailUrl: String
    let season: Int
    let episode: Int
    let episodeUrl: String
}
