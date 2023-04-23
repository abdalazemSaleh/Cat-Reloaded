//
//  PrivacyPolicyVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-04-17.
//

import UIKit
import WebKit

class PrivacyPolicyVC: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.catreloaded.org/PrivacyPolicy.html")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
        
        navigationController?.navigationBar.tintColor = Colors.mainColor
    }
}
