//
//  ProfileSettingView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class ProfileSettingView: UIView {
    
    lazy var profileSetingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "계정 설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemPurple.withAlphaComponent(0.8)
        imageView.layer.cornerRadius = 60
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var profileImageChangeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("☐", for: .normal)
        button.setTitleColor( .black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 0.5
        profileImageView.addSubview(button)
        return button
    } ()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
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
    
    lazy var nicknameUpdateView: NicknameUpateView = {
        let nicknameView = NicknameUpateView()
        nicknameView.translatesAutoresizingMaskIntoConstraints = false
        nicknameView.backgroundColor = .white
        addSubview(nicknameView)
        return nicknameView
    } ()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100)
        button.layer.cornerRadius = 10
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
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
            profileSetingTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileSetingTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: profileSetingTitleLabel.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileImageChangeButton.heightAnchor.constraint(equalToConstant: 30),
            profileImageChangeButton.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -30),
            profileImageChangeButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            profileEmailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileEmailLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            nicknameUpdateView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nicknameUpdateView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nicknameUpdateView.topAnchor.constraint(equalTo: profileEmailLabel.bottomAnchor, constant: 40),
            nicknameUpdateView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setProfileSetting(name: String, email: String) {
        self.profileNameLabel.text = name
        self.profileEmailLabel.text = email
    }
}
