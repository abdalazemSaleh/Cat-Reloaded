//
//  LoginServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-20.
//

import Foundation

enum LoginEndPoints {
    case phoneNumber([String: Any])
    case socileMedia([String: Any])
}

extension LoginEndPoints: EndPoint {
    var path: String {
        switch self {
        case .phoneNumber:
            return "/auth/signin/password"
        case .socileMedia:
            return "/auth/signup/external"
        }
    }

    var method: HTTPMethodd {
        .post
    }

    var header: [String : String]? {
        nil
    }

    var body: [String : Any]? {
        switch self {
        case .phoneNumber(let parms):
            return parms
        case .socileMedia(let parms):
            return parms
        }
    }
}

protocol LoginServiceable {
    func login(parms: [String: Any]) async throws -> User
    func loginWithSocileMedia(parms: [String: Any]) async throws -> User
}

struct LoginServices: LoginServiceable, NetworkServices {
    func login(parms: [String: Any]) async throws -> User {
        //User.self
        let userData = try await request(endPoint: LoginEndPoints.phoneNumber(parms))
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            UserDefaults.standard.set(true, forKey: "UserLogin")
            UserData.chacheUserModel(user: user)
            return user
        } catch {
            throw error
        }
    }
    
    func loginWithSocileMedia(parms: [String: Any]) async throws -> User {
        let userData = try await request(endPoint: LoginEndPoints.socileMedia(parms))
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            UserDefaults.standard.set(true, forKey: "UserLogin")
            UserData.chacheUserModel(user: user)
            return user
        } catch {
            throw error
        }
    }
}
