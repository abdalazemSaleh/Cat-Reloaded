//
//  AboutCatPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

protocol AboutCatView: AnyObject {
    func aboutCatInfo(data: [AboutCatInfoModel])
    func founders(data: [TeamBoardModel])
    func teamBoard(data: [TeamBoardModel])
    func presentEmptyView(message: String, image: UIImage)
}

class AboutCatPresenter {
    // about init & delegation
    private weak var view: AboutCatView?
    init(view: AboutCatView) {
        self.view = view
    }
    // variables
    private(set) var headerData: [AboutCatInfoModel] =  []
    
    func fetchAboutCatInfo() {
        let catInfoObject = NetworkManger(url: URLs.info.rawValue, method: .get, parms: nil, header: nil)
        catInfoObject.request(modal: AboutCatInfoModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.headerData.append(AboutCatInfoModel.init(about: data.about, history: data.history, vision: data.vision))
                self.view?.aboutCatInfo(data: self.headerData)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
    
    func fetchFounders() {
        let founderObject = NetworkManger(url: URLs.founders.rawValue, method: .get, parms: nil, header: nil)
        founderObject.request(modal: [TeamBoardModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.founders(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.rawValue, image: Images.serverError!)
                }
            }
        }
    }
    
    func fetchTeamBoard() {
        let teamBoardObject = NetworkManger(url: URLs.teamBoard.rawValue, method: .get, parms: nil, header: nil)
        teamBoardObject.request(modal: [TeamBoardModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.teamBoard(data: data)
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
