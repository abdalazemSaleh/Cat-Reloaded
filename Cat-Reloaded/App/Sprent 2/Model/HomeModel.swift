//
//  HomeModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import Foundation

// MARK: - Memories
struct MemoriesModel: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data : [MemoriesData]
}

struct MemoriesData: Codable, Hashable {
    let id: Int
    let description: String
    let imageUrl: String
    let thumbnailUrl: String
}

// MARK: - PodCat
struct PodCatModel: Codable, Hashable {
    let totalPages: Int
    let currentPage: Int
    let data : [PodCatData]
}

struct PodCatData: Codable, Hashable {
    let id: Int
    let season: Int
    let episode: Int
    let title: String
    let thumbnailUrl: String
    let episodeUrl: String
}
