//
//  ProfileInfoTableViewHead.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/17.
//

import UIKit

class ProfileInfoStackViewHeader: UIView {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemPurple.withAlphaComponent(0.8)
        imageView.layer.cornerRadius = 30
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        addSubview(label)
        return label
    } ()
    
    lazy var profileEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var accountSettingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.setTitle("계정 설정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        addSubview(button)
        return button
    } ()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(separator)
        return separator
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
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            profileEmailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            profileEmailLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 5),
            profileEmailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            accountSettingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            accountSettingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountSettingButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setProfileInfoTableViewHeader(name: String, email: String) {
        self.profileNameLabel.text = name
        self.profileEmailLabel.text = email
    }
}
