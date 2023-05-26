//
//  EditProfileServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-25.
//

import Foundation

enum EditProfileEndPoints {
    case editProfile([String: Any])
}

extension EditProfileEndPoints: EndPoint {
    var path: String {
        return "/user/profile"
    }

    var method: HTTPMethodd {
        .post
    }

    var header: [String : String]? {
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        return [ "Authorization": "Bearer " + token ]
    }

    var body: [String : Any]? {
        switch self {
        case .editProfile(let parms):
            return parms
        }
    }
}

protocol EditProfileServiceable {
    func editProfile(parms: [String: Any]) async throws -> User
}

struct EditProfileServices: EditProfileServiceable, NetworkServices {
    func editProfile(parms: [String : Any]) async throws -> User {
        do {
            _ = try await request(endPoint: EditProfileEndPoints.editProfile(parms))
            let updatedUserData = try await updateUserData()
            return updatedUserData
        } catch {
            throw error
        }
    }
    
    private func updateUserData() async throws -> User {
        let upadtedUserData = try await request(endPoint: UserAuthEndPoint.main)
        do {
            let user = try JSONDecoder().decode(User.self, from: upadtedUserData)
            UserData.chacheUserModel(user: user)
            return user
        } catch {
            throw error
        }
    }
}
