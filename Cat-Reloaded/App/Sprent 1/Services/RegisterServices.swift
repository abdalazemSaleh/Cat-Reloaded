//
//  RegisterServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-20.
//

import Foundation

enum RegisterEndPoints {
    case main([String: Any])
}

extension RegisterEndPoints: EndPoint {
    var path: String {
        return "/auth/signup/password"
    }

    var method: HTTPMethodd {
        .post
    }

    var header: [String : String]? {
        nil
    }

    var body: [String : Any]? {
        switch self {
        case .main(let parms):
            return parms
        }
    }
}

protocol RegisterServiceable {
    func register(parms: [String: Any]) async throws -> User
}

struct RegisterServices: RegisterServiceable, NetworkServices {
    func register(parms: [String: Any]) async throws -> User {
        let user = try await request(endPoint: RegisterEndPoints.main(parms), model: User.self)
        return user
    }
}
