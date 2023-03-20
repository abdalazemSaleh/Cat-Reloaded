//
//  EventsModel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-04.
//

import Foundation

struct EventModel: Hashable, Codable {
    let id: String
    let name: String
    let description: String
    let url: String
    let imageUrl: String
    let startDate: String
    let upcoming: Bool
}
