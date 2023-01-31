//
//  AboutCatPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import Foundation

protocol AboutCatView: AnyObject {
    func aboutCatInfo(data: AboutCatInfoModel)
    func founders(data: [TeamBoardModel])
    func teamBoard(data: [TeamBoardModel])
}

class AboutCatPresenter {
    // about init & delegation
    private weak var view: AboutCatView?
    init(view: AboutCatView) {
        self.view = view
    }
    // Code
    func fetchAboutCatInfo() {
        let catInfoObject = NetworkManger(url: URLs.info.rawValue, method: .get, parms: nil, header: nil)
        catInfoObject.request(modal: AboutCatInfoModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.aboutCatInfo(data: data)
            case .failure(let error):
                print(error)
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
                print(error)
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
                print(error)
            }
        }
    }
}
