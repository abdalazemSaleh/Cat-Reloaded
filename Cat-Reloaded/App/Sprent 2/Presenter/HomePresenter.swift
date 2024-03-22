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
    private var service: HomeServiceable
    init(view: HomeView, service: HomeServiceable) {
        self.view = view
        self.service = service
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
    
    func getUserData() -> User {
        return userData!
    }
    
    // Memories function
    @MainActor
    func fetchMemories(page: Int) async {
        do {
            let memories = try await service.fetchMemories(page: page)
            handelFetchMemoriesSuccessState(data: memories)
        } catch {
            print(error.localizedDescription)
            if let error = error as? GFError {
                self.handelErrorState(error: error)
            } else {
                self.handelErrorState(error: .UnKnownError)
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
                Task {
                    await fetchMemories(page: memoriesCurrentPage)
                }
            }
        }
    }
    
    // PodCat functions
    @MainActor
    func fetchPodCat(page: Int) async {
        do {
            let podCats = try await service.fetchPodCats(page: page)
            handelFetchPodCatSuccessState(data: podCats)
        } catch {
            print(error.localizedDescription)
            if let error = error as? GFError {
                self.handelErrorState(error: error)
            } else {
                self.handelErrorState(error: .UnKnownError)
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
                Task {
                    await fetchPodCat(page: podCatCurrentPage)
                }
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
}
