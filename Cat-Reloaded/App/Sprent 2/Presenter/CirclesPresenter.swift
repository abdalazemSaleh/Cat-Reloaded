//
//  CirclesPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import Foundation

protocol CirclesView: AnyObject {
    func techCircles(data: [CirclesModel])
    func nonTechCircles(data: [CirclesModel])
}

class CirclesPresenter {
    // about init & delegation
    private weak var view: CirclesView?
    init(view: CirclesView) {
        self.view = view
    }
    // Code
    func fetchTechCircles() {
        NetworkManger.shared.request(modal: [CirclesModel].self, url: URLs.techCircles.rawValue, method: .get, parms: nil, header: nil) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.techCircles(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
    
    func fetchNonTechCircles() {
        NetworkManger.shared.request(modal: [CirclesModel].self, url: URLs.nonTechCircles.rawValue, method: .get, parms: nil, header: nil) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.nonTechCircles(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
}
