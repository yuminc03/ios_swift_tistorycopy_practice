//
//  ProfileTableViewHeader.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2022/04/04.
//

import UIKit

class ProfileTableHeader: UIView {
    
    var model = ProfileModel()
//    var subscribeNum = 0
//    var profileUrl = ""
    
    var profileImageView = UIImageView()
    var blogTitleLabel = UILabel()
    var blogUrlButton = UIButton()
    var subscribeNumLabel = UILabel()
    var blogSettingButton = UIButton()
    var separator = UIView()
    
    init(model: ProfileModel, frame: CGRect) {
        super.init(frame: frame)
        self.model = model
        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
   
    private func setupView() {
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.backgroundColor = .systemBlue
        profileImageView.clipsToBounds = true
        profileImageView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        profileImageView.layer.cornerRadius = 50
        profileImageView.isUserInteractionEnabled = true
        self.addSubview(profileImageView)
        
        blogTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        blogTitleLabel.font = .systemFont(ofSize: 28, weight: .medium)
        blogTitleLabel.textColor = .white
        blogTitleLabel.text = model.profileTitle
        profileImageView.addSubview(blogTitleLabel)
        
        blogUrlButton.translatesAutoresizingMaskIntoConstraints = false
        blogUrlButton.setTitle(model.profileUrl, for: .normal)
        blogUrlButton.setTitleColor(.white, for: .normal)
        blogUrlButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        blogUrlButton.addTarget(self, action: #selector(siteUrlButtonDidTrapped), for: .touchUpInside)
        profileImageView.addSubview(blogUrlButton)
        
        subscribeNumLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribeNumLabel.font = UIFont.systemFont(ofSize: 12)
        subscribeNumLabel.textColor = .lightGray
        let text = "구독자 " + "\(model.subscribeNum)"
        let mutable = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "\(model.subscribeNum)")
        mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        subscribeNumLabel.attributedText = mutable
        self.addSubview(subscribeNumLabel)
        
        blogSettingButton.translatesAutoresizingMaskIntoConstraints = false
        blogSettingButton.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        blogSettingButton.layer.borderWidth = 0.5
        blogSettingButton.layer.cornerRadius = 15
        blogSettingButton.setTitle("블로그 설정", for: .normal)
        blogSettingButton.setTitleColor(.black, for: .normal)
        blogSettingButton.titleLabel?.font = .systemFont(ofSize: 13)
        blogSettingButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        blogSettingButton.addTarget(self, action: #selector(settingButtonDidTrapped), for: .touchUpInside)
        self.addSubview(blogSettingButton)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        self.addSubview(separator)
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([ //프로필 이미지의 위치
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([ //사이트의 제목 라벨의 위치 (프로필 이미지 위에 배치, 사이트 주소 버튼 위쪽에 배치)
            blogTitleLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            blogTitleLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -20),
            blogTitleLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([ //"구독자" 라벨의 위치
            subscribeNumLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            subscribeNumLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20)
//            subscribeNumLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([ //"블로그 설정" 버튼의 위치
            blogSettingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            blogSettingButton.centerYAnchor.constraint(equalTo: subscribeNumLabel.centerYAnchor),
            blogSettingButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([ //"사이트 주소" 버튼의 위치 (프로필 이미지의 위에 배치)
            blogUrlButton.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            blogUrlButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    @objc private func siteUrlButtonDidTrapped(button: UIButton) {
        
        if let url = URL(string: model.profileUrl),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func settingButtonDidTrapped(button: UIButton) {
        print("touched")
    }
    
}
