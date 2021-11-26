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
    
    lazy var visitLogTopView: FullScreenVisitLogWebTopView = {
        let topView = FullScreenVisitLogWebTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissFullScreenVisitLogWebViewButton.addTarget(self, action: #selector(dismissFullScreenVisitLogWebViewButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
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
            visitLogTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visitLogTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visitLogTopView.topAnchor.constraint(equalTo: view.topAnchor),
            visitLogTopView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            visitLogWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visitLogWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visitLogWebView.topAnchor.constraint(equalTo: visitLogTopView.bottomAnchor),
            visitLogWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func dismissFullScreenVisitLogWebViewButtonDidTapped(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
