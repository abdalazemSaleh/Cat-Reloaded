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
    // MARK: - Variables
    private var data: [CirclesModel] = []
    // MARK: - Functions
    
    // Demeter functoins
    func getData() -> [CirclesModel] {
        return data
    }
    
    // functions
    func fetchTechCircles() {
        let techCirclesObject = NetworkManger(url: URLs.techCircles.rawValue, method: .get, parms: nil, header: nil)
        techCirclesObject.request(modal: [CirclesModel].self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                print(data)
                self.data = data
                self.view?.techCircles(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
    
    func fetchNonTechCircles() {
        let nonTechCirclesObject = NetworkManger(url: URLs.nonTechCircles.rawValue, method: .get, parms: nil, header: nil)
        nonTechCirclesObject.request(modal: [CirclesModel].self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.data = data
                self.view?.nonTechCircles(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
}
