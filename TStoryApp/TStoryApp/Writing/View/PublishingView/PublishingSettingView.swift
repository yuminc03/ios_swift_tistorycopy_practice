//
//  PublishingSettingView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/01.
//

import UIKit

class PublishingSettingView: UIView {
    
    lazy var settingHeaderView: PublishingHeaderView = {
        let publishingHeaderView = PublishingHeaderView()
        publishingHeaderView.translatesAutoresizingMaskIntoConstraints = false
        publishingHeaderView.backgroundColor = .white
        self.addSubview(publishingHeaderView)
        return publishingHeaderView
    }()
    
    lazy var postContentsSettingView: PostContentsSettingView = {
        let postContentsSettingView = PostContentsSettingView()
        postContentsSettingView.translatesAutoresizingMaskIntoConstraints = false
        postContentsSettingView.backgroundColor = .white
        self.addSubview(postContentsSettingView)
        return postContentsSettingView
    }()
    
    lazy var categoryView: CategoryChoiceView = {
        let categoryView = CategoryChoiceView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = .white
        self.addSubview(categoryView)
        return categoryView
    }()
    
    lazy var openSettingView: OpenSettingView = {
        let openSettingView = OpenSettingView()
        openSettingView.translatesAutoresizingMaskIntoConstraints = false
        openSettingView.backgroundColor = .white
        self.addSubview(openSettingView)
        return openSettingView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            settingHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingHeaderView.topAnchor.constraint(equalTo: topAnchor),
            settingHeaderView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let headerLine = devidedLineViewFunc()
        settingHeaderView.addSubview(headerLine)
        NSLayoutConstraint.activate([
            headerLine.leadingAnchor.constraint(equalTo: settingHeaderView.leadingAnchor),
            headerLine.trailingAnchor.constraint(equalTo: settingHeaderView.trailingAnchor),
            headerLine.bottomAnchor.constraint(equalTo: settingHeaderView.bottomAnchor),
            headerLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        
        NSLayoutConstraint.activate([
            postContentsSettingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postContentsSettingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postContentsSettingView.topAnchor.constraint(equalTo: settingHeaderView.bottomAnchor),
            postContentsSettingView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        let contentSettingLine = devidedLineViewFunc()
        postContentsSettingView.addSubview(contentSettingLine)
        NSLayoutConstraint.activate([
            contentSettingLine.leadingAnchor.constraint(equalTo: postContentsSettingView.leadingAnchor),
            contentSettingLine.trailingAnchor.constraint(equalTo: postContentsSettingView.trailingAnchor),
            contentSettingLine.bottomAnchor.constraint(equalTo: postContentsSettingView.bottomAnchor),
            contentSettingLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryView.topAnchor.constraint(equalTo: postContentsSettingView.bottomAnchor),
            categoryView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let boldLine = devidedLineViewFunc()
        self.addSubview(boldLine)
        NSLayoutConstraint.activate([
            boldLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            boldLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            boldLine.topAnchor.constraint(equalTo: categoryView.bottomAnchor),
            boldLine.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            openSettingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            openSettingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            openSettingView.topAnchor.constraint(equalTo: boldLine.bottomAnchor),
            openSettingView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
}
