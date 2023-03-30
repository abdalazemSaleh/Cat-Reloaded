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
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseIdentifer)
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
        nav(vc: ProfileVC())
    }
    
    // MARK: - CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catIanArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.reuseIdentifer, for: indexPath) as! ProfileCell
        let model = catIanArray[indexPath.row]
        cell.set(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            nav(vc: SettingsVC())
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            deleteUserAccount()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row) ) {
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        }
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
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.alpha = 0
        UIView.animate(withDuration: 1, delay: 0.25) {
            view.alpha = 1
        }
    }
    
    private func deleteUserAccount() {
        
        presenter.deleteUserAccount()
        
        let alertController = UIAlertController(title: "Are you sure you need to delete your account?", message: "If there is any problem please contact us.", preferredStyle: .actionSheet)
        
        let yes = UIAlertAction(title: "Delete account", style: .destructive) { _ in
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(yes)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
    @objc private func log_out() {
        let alertController = UIAlertController(title: "Are you sure you want logout?", message: "", preferredStyle: .actionSheet)
        
        let yes = UIAlertAction(title: "Log out", style: .destructive) { _ in
            UserDefaults.standard.set(nil, forKey: "UserToken")
            UserDefaults.standard.set(false, forKey: "UserLogin")
            UserData.resetDefaults()
            self.presentLoginScreen()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(yes)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
