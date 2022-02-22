//
//  ProfileInfoTableViewFooter.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class ProfileInfoStackViewFooter: UIView {
    
    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("⚙︎", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .light)
        button.layer.cornerRadius = 10
        addSubview(button)
        return button
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
            settingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            settingButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
