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
    private var services: AboutCatServiceable
    init(view: AboutCatView, services: AboutCatServiceable) {
        self.view = view
        self.services = services
    }
    // MARK: - Variables
    private var headerData: [AboutCatInfoModel] =  []
    
    // MARK: - Functions
        
    @MainActor
    func fetchAboutCatInfo() async {
        do {
            let info = try await services.fetchInfo()
            self.headerData.append(AboutCatInfoModel.init(about: info.about, history: info.history, vision: info.vision))
            self.view?.aboutCatInfo(data: self.headerData)
        } catch {
            handelErrorState(error: error as! GFError)
        }
    }
        
    @MainActor
    func fetchFounders() async {
        do {
            let founders = try await services.fetchFounders()
            self.view?.founders(data: founders)
        } catch {
            handelErrorState(error: error as! GFError)
        }
    }
    
    @MainActor
    func fetchTeamBoard() async {
        do {
            let teamBoard = try await services.fetchTeamBoard()
            self.view?.teamBoard(data: teamBoard)
        } catch {
            handelErrorState(error: error as! GFError)
        }
    }
    
    private func handelErrorState(error: GFError) {
        if error == .connectionError {
            self.view?.presentEmptyView(message: error.localizedDescription, image: Images.networkError!)
        } else {
            self.view?.presentEmptyView(message: error.localizedDescription, image: Images.serverError!)
        }
    }
}
