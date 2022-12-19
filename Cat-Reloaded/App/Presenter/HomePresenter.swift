//
//  HomePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

protocol HomeView: AnyObject {
    func getMemories(data: HomeModel)
    func getPodCat(data: HomeModel)
}

class HomePresenter {
    // about init & delegation
    private weak var view: HomeView?
    init(view: HomeView) {
        self.view = view
    }
    // Code
    func fetchMemories() {
        NetworkManger.shared.request(modal: HomeModel.self, url: URLs.memories.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.getMemories(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPodCat() {
        NetworkManger.shared.request(modal: HomeModel.self, url: URLs.podCat.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
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
