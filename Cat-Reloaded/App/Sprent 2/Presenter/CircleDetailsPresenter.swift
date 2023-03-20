//
//  CircleDetailsPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

protocol CircleDetailsView: AnyObject {
    func techCircleDetails(data: CircleDetailsModel)
    func nonTechCircleDetails(data: CircleDetailsModel)
    func presentEmptyView(message: String, image: UIImage)
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
        let techCircleDetailsObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        techCircleDetailsObject.request(modal: CircleDetailsModel.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.techCircleDetails(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
    
    func featchNonTechCircleDetails(_ circle: String) {
        let url = URLs.nonTechCircles.rawValue + "/\(circle)"
        let nonTechCircleDetailsObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        nonTechCircleDetailsObject.request(modal: CircleDetailsModel.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.view?.nonTechCircleDetails(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
}
