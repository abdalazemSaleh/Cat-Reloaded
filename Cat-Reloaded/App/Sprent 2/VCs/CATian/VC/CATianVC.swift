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
    
      lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.bounds, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        tv.register(ProfileFooter.self, forHeaderFooterViewReuseIdentifier: self.footerId)
        tv.register(ProfileCell.self, forCellReuseIdentifier: self.cellId)
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
    }
}
