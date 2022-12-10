//
//  CATianVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class CATianVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private let headerId = "headerId"
    private let footerId = "footerId"
    private let cellId = "cellId"

    lazy var tableView: UITableView = {

        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        tv.register(CustomTableViewFooter.self, forHeaderFooterViewReuseIdentifier: self.footerId)
        tv.register(CustomTableCell.self, forCellReuseIdentifier: self.cellId)
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        return tv
    }()

    //
    // MARK :- HEADER
    //
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! CustomTableViewHeader
        return header
    }

    //
    // MARK :- FOOTER
    //
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        return 150
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId) as! CustomTableViewFooter
        return footer
    }

    //
    // MARK :- CELL
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupAutoLayout()
    }

    func setupAutoLayout() {

        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}
