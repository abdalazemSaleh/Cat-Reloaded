//
//  CATianVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class CATianVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let headerId = "headerId"
    let footerId = "footerId"
    let cellId = "cellId"
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureTableView()
        
    }
}
