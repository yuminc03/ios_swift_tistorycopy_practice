//
//  postWebView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/14.
//

import UIKit
import WebKit

class PostWebViewController: UIViewController, WKUIDelegate {

    var postUrl: String = ""
    
    lazy var postWebViewHeader: PostWebViewHeader = {
        let headerView = PostWebViewHeader()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        headerView.backToHomeButton.addTarget(self, action: #selector(backToHomeButtonDidTapped), for: .touchUpInside)
        view.addSubview(headerView)
        return headerView
    } ()
    
    lazy var postWebView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.uiDelegate = self
        view.addSubview(webView)
        return webView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        let recentlyPostUrl = URL(string: postUrl)
        let urlRequest = URLRequest(url: recentlyPostUrl!)
        postWebView.load(urlRequest)
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            postWebViewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postWebViewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postWebViewHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postWebViewHeader.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            postWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postWebView.topAnchor.constraint(equalTo: postWebViewHeader.bottomAnchor),
            postWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setPostUrl(url: String) {
        self.postUrl = url
    }
    
    @objc private func backToHomeButtonDidTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
