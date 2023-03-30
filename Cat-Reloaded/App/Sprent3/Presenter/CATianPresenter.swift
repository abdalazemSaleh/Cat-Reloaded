//
//  CATianPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-29.
//

import Foundation
import Alamofire

struct DeleteAccountModel: Codable {
}

protocol CATianView: AnyObject {
    func presentLoginScreen()
    func showAlerMessage(message: String)
}

class CATianPresenter {
    // Initialzer
    private weak var view: CATianView?
    init(view: CATianView) {
        self.view = view
    }
    
    // Code
    func deleteUserAccount() {
        let url = URLs.deleteAccount.rawValue
    
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + token,
        ]
        
        let deleteAccountObject = NetworkManger(url: url, method: .post, parms: nil, header: header)
        deleteAccountObject.request(modal: DeleteAccountModel.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(_):
                self.view?.presentLoginScreen()
            case .failure(let error):
                self.view?.showAlerMessage(message: error.rawValue)
            }
        }
    }
}
