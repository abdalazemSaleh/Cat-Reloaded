//
//  HomePresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

protocol HomeView: AnyObject {
    func getMemories(data: MainHomeModel)
}

class HomePresenter {
    // about init & delegation
    private weak var view: HomeView?
    init(view: HomeView) {
        self.view = view
    }
    // Code
    func fetchMemories() {
        NetworkManger.shared.request(modal: MainHomeModel.self, url: URLs.memories.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
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
        NetworkManger.shared.request(modal: PodCat.self, url: URLs.podCat.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
