//
//  ProfilePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-29.
//

import Foundation
import Alamofire

struct UpdateUserData: Codable {
}

protocol ProfileView: AnyObject {
    func handelButtonStyle()
    func showAlerMessage(message: String)
}

class ProfilePresenter {
    // about init & delegation
    private weak var view: ProfileView?
    private var service: EditProfileServiceable!
    init(view: ProfileView) {
        self.view = view
        self.service = EditProfileServices()
    }
    
    @MainActor
    func updateUserProfile(parms: [String: Any]) {
        Task {
            do {
                _ = try await service.editProfile(parms: parms)
                self.view?.handelButtonStyle()
                self.view?.showAlerMessage(message: "Data changed successfuly")
            } catch {
                self.view?.handelButtonStyle()
                self.view?.showAlerMessage(message: "Error while changing data please try agine later.")
            }
        }
    }
}
