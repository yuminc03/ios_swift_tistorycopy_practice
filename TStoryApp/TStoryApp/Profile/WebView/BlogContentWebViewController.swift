//
//  BlogContentWebViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/23.
//

import UIKit
import WebKit

class BlogContentWebViewController: UIViewController {
    
    let navigationView = BlogContentNavigationBarView()
    let webViewContainer = UIView()
    var urlString: String = "https://dpffldk.tistory.com/m/16"
    var webView: WKWebView?
    var webViewConfigulation: WKWebViewConfiguration?
    var loadingView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setConstraints()
        self.loadUrl(url: urlString)
    }
    
    deinit {
        
        webView = nil
    }
    
    private func setupView() {
        webViewContainer.translatesAutoresizingMaskIntoConstraints = false
        webViewContainer.backgroundColor = .clear
        self.view.addSubview(webViewContainer)
        
        webViewConfigulation = WKWebViewConfiguration()
        webViewConfigulation?.userContentController = WKUserContentController()
        webView = WKWebView(frame: webViewContainer.bounds, configuration: webViewConfigulation!)
        webView!.translatesAutoresizingMaskIntoConstraints = false
        webView!.backgroundColor = .clear
//        webView!.uiDelegate = self
        webView!.navigationDelegate = self
        webView!.scrollView.delegate = self
        self.view.addSubview(webView!)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.backgroundColor = .white
        navigationView.previousButton.addTarget(self, action: #selector(previousButtonDidTapped), for: .touchUpInside)
        self.view.addSubview(navigationView) 

        loadingView.style = .large
        loadingView.hidesWhenStopped = true
        loadingView.center = self.view.center
        self.view.addSubview(loadingView)
    }
    
    private func loadUrl(url: String) {
        
        if let url = URL(string: url) {
            
            let urlReqeust = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            webView!.load(urlReqeust)
        }
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            webViewContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webViewContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webViewContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webViewContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])

        if let webView = self.webView {
            
            NSLayoutConstraint.activate([
                webView.leadingAnchor.constraint(equalTo: webViewContainer.leadingAnchor),
                webView.trailingAnchor.constraint(equalTo: webViewContainer.trailingAnchor),
                webView.topAnchor.constraint(equalTo: webViewContainer.topAnchor),
                webView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor)
            ])
        }
        
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    @objc private func previousButtonDidTapped() {
        
        self.navigationController?.popViewController(animated: true)
    }
}

//extension BlogContentWebViewController: WKUIDelegate {
//
//
//}

extension BlogContentWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        loadingView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        loadingView.stopAnimating()
        print("error: \(error)")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        loadingView.stopAnimating()
    }
    
}

extension BlogContentWebViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y >= 50 {
            
            navigationView.isHidden = true
        }
        else {
            
            navigationView.isHidden = false
        }
    }
}

//extension BlogContentWebViewController: WKScriptMessageHandler {
//
//    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//        <#code#>
//    }
//}
