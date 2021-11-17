//
//  ProfileInfoTableViewHead.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/17.
//

import UIKit

class ProfileInfoTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBlue
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
        button.setTitle("계정 설정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
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
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileEmailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            profileEmailLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            accountSettingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            accountSettingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountSettingButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
