//
//  FullScreenVisitLogWebViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/23.
//

import UIKit
import WebKit

class FullScreenVisitLogWebViewController: UIViewController, WKUIDelegate {
    
    var visitLogUrl: String = ""
    
    lazy var visitLogWebView: WKWebView = {
        let webConfigulation = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfigulation)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.uiDelegate = self
        view.addSubview(webView)
        return webView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        let recentlyVisitLogUrl = URL(string: self.visitLogUrl)
        let urlRequest = URLRequest(url: recentlyVisitLogUrl!)
        visitLogWebView.load(urlRequest)
    }
    
    init(visitLogUrl: String) {
        self.visitLogUrl = visitLogUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            visitLogWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visitLogWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visitLogWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            visitLogWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
