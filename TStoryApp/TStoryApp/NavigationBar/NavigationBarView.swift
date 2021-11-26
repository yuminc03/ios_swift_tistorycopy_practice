//
//  NavigationBarView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/17.
//

import UIKit

class NavigationBarView: UIView {
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .clear
        label.font = .systemFont(ofSize: 20)
        addSubview(label)
        return label
    } ()
    
    lazy var blogSearchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⎋", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var blogProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.setTitle("☕️", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
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
//        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            blogSearchButton.trailingAnchor.constraint(equalTo: blogProfileButton.leadingAnchor, constant: -15),
            blogSearchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            blogSearchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            blogProfileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            blogProfileButton.centerYAnchor.constraint(equalTo: blogSearchButton.centerYAnchor),
            blogProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
