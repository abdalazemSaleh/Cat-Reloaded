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
    
    #warning("Refactor this method")
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let rowImage            = GFImageView(frame: .zero)
        let labelCell           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
        let arrowImage          = GFImageView(frame: .zero)
        let appearanceLabel     = GFBodyLabel(textAlignment: .center)
        let button              = GFSimpleButton()
        view.addSubview(button)
        view.addSubview(rowImage)
        view.addSubview(labelCell)
        view.addSubview(appearanceLabel)
        view.addSubview(arrowImage)

        labelCell.text = presenter.settings[section].label
        appearanceLabel.text = presenter.settings[section].addetionalDetails
        rowImage.image = presenter.settings[section].image
        rowImage.tintColor = Colors.mainColor
        arrowImage.image        = UIImage(systemName: "chevron.down")
        arrowImage.tintColor    = .secondaryLabel
        
        button.tag = section
        button.addTarget(self, action: #selector(hideSection(sender:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rowImage.heightAnchor.constraint(equalToConstant: 24),
            rowImage.widthAnchor.constraint(equalToConstant: 24),
            rowImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rowImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            labelCell.leadingAnchor.constraint(equalTo: rowImage.trailingAnchor, constant: 8),
            labelCell.centerYAnchor.constraint(equalTo: rowImage.centerYAnchor),
            
            arrowImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            appearanceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appearanceLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -8),
            
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
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
