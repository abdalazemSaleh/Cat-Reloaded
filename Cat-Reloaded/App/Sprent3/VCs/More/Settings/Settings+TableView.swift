//
//  Settings+TableView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.settingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.hiddenSections.contains(section) {
            return 0
        }
        return presenter.settingsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.settingsData[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let labelCell = presenter.settings[section].label
        let appearanceLabel = presenter.settings[section].addetionalDetails
        let rowImage = presenter.settings[section].image
        
        let view = SettingsHeaderView(labelCell: labelCell, appearanceLabel: appearanceLabel, rowImage: rowImage) {
            button.tag = section
            self.hideSection(sender: button)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    @objc private func hideSection(sender: UIButton) {
        let section = sender.tag
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()

            for row in 0..<self.presenter.settingsData[section].count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }

            return indexPaths
        }
        if presenter.hiddenSections.contains(section) {
            presenter.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            presenter.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                presenter.configureUserInterFace(theme: .dark)
            case 1:
                presenter.configureUserInterFace(theme: .light)
            default:
                presenter.configureUserInterFace(theme: .system)
            }
        default:
            presentGFAlert(title: "Hello", message: "We Woking on it. 🫠", buttonTitle: "OK")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
