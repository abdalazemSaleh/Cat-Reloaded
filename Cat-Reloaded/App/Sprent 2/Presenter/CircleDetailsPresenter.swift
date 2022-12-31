//
//  CircleDetailsPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import Foundation

protocol CircleDetailsView: AnyObject {
    func techCircleDetails(data: CircleDetailsModel)
    func nonTechCircleDetails(data: CircleDetailsModel)
}

class CircleDetailsPresenter {
    // about init & delegation
    private weak var view: CircleDetailsView?
    init(view: CircleDetailsView) {
        self.view = view
    }
    // Code
    func featchTechCircleDetails(_ circle: String) {
        let url = URLs.techCircles.rawValue + "/\(circle)"
        NetworkManger.shared.request(modal: CircleDetailsModel.self, url: url, method: .get, parms: nil, header: nil) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.techCircleDetails(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
    
    func featchNonTechCircleDetails(_ circle: String) {
        let url = URLs.nonTechCircles.rawValue + "/\(circle)"
        NetworkManger.shared.request(modal: CircleDetailsModel.self, url: url, method: .get, parms: nil, header: nil) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.nonTechCircleDetails(data: data)
            case .failure(let gFErro):
                print(gFErro)
            }
        }
    }
}

