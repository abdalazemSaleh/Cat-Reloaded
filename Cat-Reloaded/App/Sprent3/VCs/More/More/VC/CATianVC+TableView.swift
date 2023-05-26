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
            nav(vc: PrivacyPolicyVC())
        case 2:
            let vc = ContactUsVC()
            vc.modalPresentationStyle  = .overFullScreen
            vc.modalTransitionStyle    = .crossDissolve
            self.present(vc, animated: true)
        case 3:
            openSocialMedia(with: "https://www.facebook.com/groups/11705900412", type: .facebook)
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
        
        let alertController = UIAlertController(title: "Are you sure you need to delete your account?", message: "If there is any problem please contact us.", preferredStyle: .actionSheet)
        
        let yes = UIAlertAction(title: "Delete account", style: .destructive) { _ in
            self.presenter.deleteUserAccount()
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


class ContactUsVC: UIViewController {
    
    let containerView = UIView()
    
    let facebookButton = GFMediaButton(backgroundColor: .clear, image: Images.facebook!)
    let googleButton = GFMediaButton(backgroundColor: .clear, image: Images.google!)
    let linkedinButton = GFMediaButton(backgroundColor: .clear, image: Images.linkedin)
    let instagramButton = GFMediaButton(backgroundColor: .clear, image: Images.instagram)

    let mediaStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
        configureStackView()
    }
    
    private func configureContainerView() {
        view.backgroundColor = .black.withAlphaComponent(0.05)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismisVC))
        view.addGestureRecognizer(gesture)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 8
        containerView.addShadow()
        containerView.makeConstraints(centerXAnchor: view.centerXAnchor,
                                      centerYAnchor: view.centerYAnchor,
                                      size: CGSize(width: view.frame.width - 80, height: 128))
        
    }
    
    @objc private func dismisVC() {
        dismiss(animated: true)
    }
    
    private func configureStackView() {
        containerView.addSubview(mediaStackView)
        let buttons: [GFMediaButton] = [facebookButton, googleButton, linkedinButton, instagramButton]
        for button in buttons {
            mediaStackView.addArrangedSubview(button)
            button.makeConstraints(size: CGSize(width: 40, height: 40))
        }
        configureButtonsAction()
        mediaStackView.axis = .horizontal
        mediaStackView.spacing = 32
        
        mediaStackView.makeConstraints(centerXAnchor: view.centerXAnchor,
                                       centerYAnchor: view.centerYAnchor)
    }
    
    private func configureButtonsAction() {
        facebookButton.addTarget(self, action: #selector(openFacebook), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(openGoogle), for: .touchUpInside)
        linkedinButton.addTarget(self, action: #selector(openLinkedin), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(openinstagram), for: .touchUpInside)
    }
    
    @objc private func openFacebook() {
        openSocialMedia(with: "https://www.facebook.com/groups/11705900412", type: .facebook)
    }
    
    @objc private func openGoogle() {
        UIApplication.shared.open(URL(string: "mailto:catreloaded.support@catreloaded.net")! as URL,
            options: [:], completionHandler: nil)
    }
    
    @objc private func openLinkedin() {
        openSocialMedia(with: "https://www.linkedin.com/company/cat-reloaded/?originalSubdomain=eg", type: .linkedin)
    }

    @objc private func openinstagram() {
        openSocialMedia(with: "https://www.instagram.com/catreloaded/", type: .facebook)
    }
}
