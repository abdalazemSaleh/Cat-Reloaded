//
//  HomeServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-06-24.
//

import Foundation

enum HomeEndPoints {
    case memories(page: Int)
    case podCat(page: Int)
}

extension HomeEndPoints: EndPoint {
    var path: String {
        switch self {
        case .memories(let page):
            return "/team/memories" + "/\(page)"
        case .podCat(let page):
            return "/team/podcat" + "/\(page)"
        }
    }
    
    var method: HTTPMethodd {
        .get
    }
    
    var header: [String : String]? {
        nil
    }
    
    var body: [String : Any]? {
        nil
    }
}

protocol HomeServiceable {
    func fetchMemories(page: Int) async throws -> MemoriesModel
    func fetchPodCats(page: Int) async throws -> PodCatModel
}

struct HomeServices: HomeServiceable, NetworkServices {
    func fetchMemories(page: Int) async throws -> MemoriesModel {
        let memoriesData = try await request(endPoint: HomeEndPoints.memories(page: page))
        do {
            let memories = try JSONDecoder().decode(MemoriesModel.self, from: memoriesData)
            return memories
        } catch {
            throw error
        }
    }
    
    func fetchPodCats(page: Int) async throws -> PodCatModel {
        let podCatsData = try await request(endPoint: HomeEndPoints.podCat(page: page))
        do {
            let podCats = try JSONDecoder().decode(PodCatModel.self, from: podCatsData)
            return podCats
        } catch {
            throw error
        }
    }
}
