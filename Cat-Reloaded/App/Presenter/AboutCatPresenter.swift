//
//  AboutCatPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-21.
//

import Foundation

protocol AboutCatView: AnyObject {
    func aboutCatInfo(data: AboutCatInfoModel)
    func founders(data: [FoundersModel])
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
        NetworkManger.shared.request(modal: AboutCatInfoModel.self, url: URLs.info.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
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
        NetworkManger.shared.request(modal: [FoundersModel].self, url: URLs.founders.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
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
        NetworkManger.shared.request(modal: [TeamBoardModel].self, url: URLs.teamBoard.rawValue, method: .get, parms: nil, header: nil) { [weak self] result in
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
