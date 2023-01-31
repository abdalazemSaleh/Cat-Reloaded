//
//  HomePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import Foundation

protocol HomeView: AnyObject {
    func getMemories(data: MemoriesModel)
    func getPodCat(data: PodCatModel)
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
                print(data)
                self.view?.getMemories(data: data)
            case .failure(let error):
                print(error)
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
                print(error)
            }
        }
    }
}
