//
//  Settings+TableView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class SettingsCell: GFSimpleCell {
    // MARK: - Variables
    static let reuseIdentifer   = "SettingsCell"
    
    var menuActions: [UIAction] = []
    
    let appearanceLabel = GFBodyLabel(textAlignment: .center)
    let button = GFSimpleButton()
    
    // MARK: - Initilaizer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(appearanceLabel)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(handel), for: .touchUpInside)

        button.showsMenuAsPrimaryAction  = true

        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            appearanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            appearanceLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -8)
        ])
    }
    
    @objc func handel() {
        button.menu = UIMenu(children: menuActions)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Set function
    func set(model: SettingsModel) {
        rowImage.image  = model.image
        labelCell.text  = model.label
        appearanceLabel.text = model.addetionalDetails
    }
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerTableViewCells() {
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifer)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifer, for: indexPath) as! SettingsCell
        let model = settings[indexPath.row]
        cell.set(model: model)
        switch indexPath.row {
        case 0:
            cell.menuActions = [
                UIAction(title: "Dark Mode", identifier: UIAction.Identifier(Theme.dark.rawValue), handler: checkApperance),
                UIAction(title: "Light Mode", identifier: UIAction.Identifier(Theme.light.rawValue), handler: checkApperance),
                UIAction(title: "System", identifier: UIAction.Identifier(Theme.system.rawValue), handler: checkApperance)
            ]
        case 1:
            cell.menuActions = [
                UIAction(title: "English", identifier: UIAction.Identifier("English"), handler: checkLanguage),
                UIAction(title: "Arabic", identifier: UIAction.Identifier("Arabic"), handler: checkLanguage),
            ]
        default:
            break
        }
        return cell
    }
    
    func checkApperance(action: UIAction) {
        switch action.identifier.rawValue {
        case Theme.dark.rawValue:
            configureUserInterFace(theme: .dark)
        case Theme.light.rawValue:
            configureUserInterFace(theme: .light)
        case Theme.system.rawValue:
            configureUserInterFace(theme: .system)
        default:
            print("woops")
        }
    }
    
    func checkLanguage(action: UIAction) {
        print("Working on it.")
    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row) ) {
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
