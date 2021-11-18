//
//  SettingView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class SettingView: UIView {
    
    lazy var settingTopView: SettingTopView = {
        let topView = SettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        addSubview(topView)
        return topView
    } ()
    
    lazy var settingStackView: SettingStackView = {
        let stackView = SettingStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
        return stackView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            settingTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingTopView.topAnchor.constraint(equalTo: topAnchor),
            settingTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            settingStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingStackView.topAnchor.constraint(equalTo: settingTopView.bottomAnchor),
            settingTopView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
