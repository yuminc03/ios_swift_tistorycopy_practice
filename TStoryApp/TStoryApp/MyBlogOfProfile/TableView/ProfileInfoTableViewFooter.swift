//
//  ProfileInfoTableViewFooter.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class ProfileInfoTableViewFooter: UITableViewHeaderFooterView {
    
    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("⚙︎", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .light)
        button.layer.cornerRadius = 10
        addSubview(button)
        return button
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
