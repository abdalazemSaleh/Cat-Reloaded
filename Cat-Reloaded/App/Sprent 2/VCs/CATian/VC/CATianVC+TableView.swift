//
//  CATianVC+TableView.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

extension CATianVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tableView)
        registerTableViewCells()
        tableViewCustomConfiguration()
    }
    
    private func registerTableViewCells() {
        tableView.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        tableView.register(ProfileFooter.self, forHeaderFooterViewReuseIdentifier: self.footerId)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    private func tableViewCustomConfiguration() {
        tableView.backgroundColor   = .systemBackground
        tableView.separatorStyle    = .none
        tableView.delegate          = self
        tableView.dataSource        = self
    }
    
    // MARK: - HEADER
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! ProfileHeader
        header.viewProfileButton.addTarget(self, action: #selector(viewProfile), for: .touchUpInside)
        return header
    }
    
    @objc private func viewProfile() {
        presentGFAlert(title: "Hi🙋🏼‍♂️", message: "We working on this wait for more. 👻", buttonTitle: "Ok")
    }
    
    // MARK: - CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catIanArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        let model = catIanArray[indexPath.row]
        cell.set(model: model)
        return cell
    }

    // MARK: - FOOTER
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId) as! ProfileFooter
        footer.log_outButton.addTarget(self, action: #selector(log_out), for: .touchUpInside)
        return footer
    }
    @objc private func log_out() {
        print("Good bye.👋🏻")
        UserData.resetDefaults()
        presentLoginScreen()
    }
}
