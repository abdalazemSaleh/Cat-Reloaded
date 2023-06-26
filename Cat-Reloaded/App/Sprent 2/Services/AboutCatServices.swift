//
//  AboutCatServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-06-24.
//

import Foundation

enum AboutCatEndPoint {
    case info
    case founders
    case teamBoard
}

extension AboutCatEndPoint: EndPoint {
    var path: String {
        switch self {
        case .info:
            return "/team/info"
        case .founders:
            return "/team/founders"
        case .teamBoard:
            return "/team/board"
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

protocol AboutCatServiceable {
    func fetchInfo() async throws -> AboutCatInfoModel
    func fetchFounders() async throws -> [TeamBoardModel]
    func fetchTeamBoard() async throws -> [TeamBoardModel]
}

struct AboutCatServices: AboutCatServiceable, NetworkServices {
    func fetchInfo() async throws -> AboutCatInfoModel {
        let infoData = try await request(endPoint: AboutCatEndPoint.info)
        do {
            let info = try JSONDecoder().decode(AboutCatInfoModel.self, from: infoData)
            return info
        } catch {
            throw error
        }
    }
    
    func fetchFounders() async throws -> [TeamBoardModel] {
        let foundersData = try await request(endPoint: AboutCatEndPoint.founders)
        do {
            let founders = try JSONDecoder().decode([TeamBoardModel].self, from: foundersData)
            return founders
        } catch {
            throw error
        }
    }
    
    func fetchTeamBoard() async throws -> [TeamBoardModel] {
        let teamBoardData = try await request(endPoint: AboutCatEndPoint.teamBoard)
        do {
            let teamBoard = try JSONDecoder().decode([TeamBoardModel].self, from: teamBoardData)
            return teamBoard
        } catch {
            throw error
        }
    }
}

