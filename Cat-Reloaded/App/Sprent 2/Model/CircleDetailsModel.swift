//
//  CircleDetailsModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

struct CircleDetailsModel: Hashable, Codable {
    let id: String
    let name: String
    let type: String
    let imageUrl: String
    let description: String
    let roadmapUrl: String?
    let board: [TeamBoardModel]
}
