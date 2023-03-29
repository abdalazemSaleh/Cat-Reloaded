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
    init(view: ProfileView) {
        self.view = view
    }
    
    // Code
    func updateUserProfile(parms: [String: Any]) {
        let url = URLs.updateProfile.rawValue
        
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + token,
        ]

        
        let updateProfileObject = NetworkManger(url: url, method: .post, parms: parms, header: header)
        updateProfileObject.request(modal: UpdateUserData.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(_):
                self.view?.handelButtonStyle()
                self.view?.showAlerMessage(message: "Data changed successfuly")
            case .failure(_):
                self.view?.handelButtonStyle()
                self.view?.showAlerMessage(message: "Error while changing data please try agine later.")
            }
        }
        
    }
}
