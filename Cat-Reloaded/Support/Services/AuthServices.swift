//
//  AuthServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-20.
//

import Foundation

enum UserAuthEndPoint {
    case main
}

extension UserAuthEndPoint: EndPoint {
    var path: String {
        return "/user/info"
    }
    
    var method: HTTPMethodd {
        return .get
    }
    
    var header: [String : String]? {
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        return [ "Authorization": "Bearer " + token ]
    }
    
    var body: [String : Any]? {
        return nil
    }
}

protocol UserAuthService {
    func checkUserAuth() async throws -> User
}

struct UserAuth: UserAuthService, NetworkServices {
    func checkUserAuth() async throws -> User {
        do {
            let user = try await request(endPoint: UserAuthEndPoint.main, model: User.self)
            UserDefaults.standard.set(true, forKey: "UserLogin")
            UserData.chacheUserModel(user: user)
            return user
        } catch {
            UserDefaults.standard.set(false, forKey: "UserLogin")
            throw error
        }
    }
}
