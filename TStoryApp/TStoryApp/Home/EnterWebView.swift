//
//  EnterWebView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/14.
//

import WebKit

class EnterWebView: WKWebView {
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: .zero, configuration: configuration)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
    }
}
