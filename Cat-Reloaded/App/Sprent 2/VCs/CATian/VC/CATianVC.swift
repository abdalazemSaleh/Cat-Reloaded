//
//  CATianVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

struct CATianModel {
    let image: String
    let name: String
}

class CATianVC: UIViewController {
    // MARK: - Variables
    let headerId = "headerId"
    let footerId = "footerId"
    let cellId   = "cellId"
    
    var catIanArray: [CATianModel]    = []
    
    var tableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        catIanArray.append(CATianModel(image: "2", name: "Hello World"))
        catIanArray.append(CATianModel(image: "2", name: "Hello World"))
        catIanArray.append(CATianModel(image: "2", name: "Hello World"))
        catIanArray.append(CATianModel(image: "2", name: "Hello World"))
        catIanArray.append(CATianModel(image: "2", name: "Hello World"))
        configureTableView()
    }
}
