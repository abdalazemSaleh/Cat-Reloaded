//
//  HomePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit
import Alamofire

protocol HomeView: AnyObject {
    func getMemories(data: MemoriesModel)
    func getPodCat(data: PodCatModel)
    func presentEmptyView(message: String, image: UIImage)
    func presentAlert(message: String, title: String)
}

class HomePresenter {
    // about init & delegation
    private weak var view: HomeView?
    init(view: HomeView) {
        self.view = view
    }
    // Code
    func fetchMemories(page: Int) {
        let url = URLs.memories.rawValue + "/\(page)"
        let memoriesObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        memoriesObject.request(modal: MemoriesModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.getMemories(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
    
    func fetchPodCat(page: Int) {
        let url = URLs.podCat.rawValue + "/\(page)"
        let podCatObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        podCatObject.request(modal: PodCatModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.getPodCat(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
    
    func checkUserData() {
        let url = URLs.userData.rawValue
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + token,
        ]
        let userDataObject = NetworkManger(url: url, method: .get, parms: nil, header: header)
        userDataObject.request(modal: UserInfo.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                print("User token is: - \(data)")
            case .failure(let error):
                print(error)
                self.view?.presentAlert(message: error.rawValue, title: "Go to login")
            }
        }
    }
}
