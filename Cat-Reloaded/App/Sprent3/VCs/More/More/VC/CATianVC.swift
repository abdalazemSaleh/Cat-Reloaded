//
//  CATianVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

struct CATianModel {
    let image: UIImage
    let name: String
}

class CATianVC: UIViewController {
    
    // MARK: - Variables
    let headerId = "headerId"
    let footerId = "footerId"
    
    var catIanArray: [CATianModel]    = []
    
    var tableView: UITableView!
    
    var presenter: CATianPresenter!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        add_openCardButton()
        presenter = CATianPresenter(view: self)
        catIanArray.append(CATianModel(image: SFSymbols.setting, name: "Settings"))
        catIanArray.append(CATianModel(image: SFSymbols.privacy, name: "Privacy Policy"))
        catIanArray.append(CATianModel(image: SFSymbols.countact, name: "Contact Us"))
        catIanArray.append(CATianModel(image: SFSymbols.rate, name: "Rate Us"))
        catIanArray.append(CATianModel(image: SFSymbols.delete, name: "Delete Account"))
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = false
    }

}
