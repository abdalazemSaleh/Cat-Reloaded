//
//  HomePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit
import Alamofire

protocol HomeView: AnyObject {
    func getMemories(data: [MemoriesData])
    func getPodCat(data: [PodCatData])
    func presentEmptyView(message: String, image: UIImage)
    func presentAlert(message: String, title: String)
}

class HomePresenter {
    // about init & delegation
    private weak var view: HomeView?
    init(view: HomeView) {
        self.view = view
    }
    // MARK: -  Variables
    private let userData = UserData.getUserModel()
    /// Memories
    private var memories: [MemoriesData] = []
    private var memoriesPages = 1
    private var num_ofMemories = 10
    private var memoriesCurrentPage = 1
    /// PodCat
    private var podCats: [PodCatData] = []
    private var podCatPages = 1
    private var num_ofPodCat = 10
    private var podCatCurrentPage = 1

    // MARK: - Functions
    
    // Demeter functions
    func getMemories() -> [MemoriesData] {
        return memories
    }
    
    func getMemoriesPages() -> Int {
        return memoriesPages
    }
    
    func getPodCats() -> [PodCatData] {
        return podCats
    }
    
    func getPodCatPages() -> Int {
        return podCatPages
    }
    
    func isCatian() -> Bool {
        let isCatian = userData?.isCatian ?? true
        return isCatian
    }
    
    func getUserData() -> UserInfo {
        return userData!
    }
    
    // Memories function
    func fetchMemories(page: Int) {
        let url = URLs.memories.rawValue + "/\(page)"
        let memoriesObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        memoriesObject.request(modal: MemoriesModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.handelFetchMemoriesSuccessState(data: data)
            case .failure(let error):
                self.handelErrorState(error: error)
            }
        }
    }
    
    private func handelFetchMemoriesSuccessState(data: MemoriesModel) {
        let memories = data.data
        self.memoriesPages = data.totalPages
        self.memories.append(contentsOf: memories)
        self.view?.getMemories(data: memories)
    }
    
    func handelMemoriesPageNation(indexPath: IndexPath) {
        if (indexPath.row == num_ofMemories - 1) {
            for _ in 1..<memoriesPages  {
                memoriesCurrentPage += 1
                num_ofMemories += 10
                fetchMemories(page: memoriesCurrentPage)
            }
        }
    }
    
    // PodCat functions
    func fetchPodCat(page: Int) {
        let url = URLs.podCat.rawValue + "/\(page)"
        let podCatObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        podCatObject.request(modal: PodCatModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.handelFetchPodCatSuccessState(data: data)
            case .failure(let error):
                self.handelErrorState(error: error)
            }
        }
    }
    
    private func handelFetchPodCatSuccessState(data: PodCatModel) {
        let podCats =  data.data
        podCatPages = data.totalPages
        self.podCats.append(contentsOf: podCats)
        self.view?.getPodCat(data: podCats)
    }
    
    private func handelPodCatPagenation(indexPath: IndexPath) {
        if (indexPath.row == num_ofPodCat - 1) {
            let page = podCatPages
            for _ in 1..<page {
                podCatCurrentPage += 1
                num_ofPodCat      += 10
                fetchPodCat(page: podCatCurrentPage)
            }
        }
    }

    // Handel error function
    private func handelErrorState(error: GFError) {
        if error == .connectionError {
            self.view?.presentEmptyView(message: error.localizedDescription, image: Images.networkError!)
        } else {
            self.view?.presentEmptyView(message: error.localizedDescription, image: Images.serverError!)
        }
    }
    
    // Check user data ::::
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
                self.view?.presentAlert(message: error.localizedDescription, title: "Go to login")
            }
        }
    }
}
