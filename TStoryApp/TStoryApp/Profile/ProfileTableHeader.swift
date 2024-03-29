//
//  ProfileTableViewHeader.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2022/04/04.
//

import UIKit

class ProfileTableHeader: UIView {
    
    var model = ProfileModel()
//    var subscribeNum = 0
//    var profileUrl = ""
    
    var profileImageView = UIImageView()
    var imageMultiplyCover = UIView()
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
        profileImageView.backgroundColor = .black
        let bgImage = UIImage(named: model.profileImageName ?? "")
        profileImageView.image = bgImage
        profileImageView.clipsToBounds = true
        profileImageView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        profileImageView.layer.cornerRadius = 50
        profileImageView.isUserInteractionEnabled = true
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        self.addSubview(profileImageView)
        
        imageMultiplyCover.translatesAutoresizingMaskIntoConstraints = false
        imageMultiplyCover.backgroundColor = .black.withAlphaComponent(0.3)
        imageMultiplyCover.layer.maskedCorners = .layerMaxXMaxYCorner
        imageMultiplyCover.layer.cornerRadius = 50
        profileImageView.addSubview(imageMultiplyCover)
        
        blogTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        blogTitleLabel.font = .systemFont(ofSize: 32)
        blogTitleLabel.textColor = .white
        blogTitleLabel.text = model.profileTitle
        blogTitleLabel.sizeToFit()
        profileImageView.addSubview(blogTitleLabel)
        
        blogUrlButton.translatesAutoresizingMaskIntoConstraints = false
        blogUrlButton.setTitle("dpffldk.tistory.com", for: .normal)
        blogUrlButton.setTitleColor(.white, for: .normal)
        blogUrlButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        blogUrlButton.addTarget(self, action: #selector(siteUrlButtonDidTrapped), for: .touchUpInside)
        profileImageView.addSubview(blogUrlButton)
        
        subscribeNumLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribeNumLabel.font = UIFont.systemFont(ofSize: 14)
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
        blogSettingButton.titleLabel?.font = .systemFont(ofSize: 14)
        blogSettingButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        self.addSubview(blogSettingButton)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.2)
        self.addSubview(separator)
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([ //프로필 이미지의 위치
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            imageMultiplyCover.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            imageMultiplyCover.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            imageMultiplyCover.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            imageMultiplyCover.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([ //"사이트 주소" 버튼의 위치 (프로필 이미지의 위에 배치)
            blogUrlButton.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            blogUrlButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([ //사이트의 제목 라벨의 위치 (프로필 이미지 위에 배치, 사이트 주소 버튼 위쪽에 배치)
            blogTitleLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            blogTitleLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -20),
            blogTitleLabel.bottomAnchor.constraint(equalTo: blogUrlButton.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([ //"구독자" 라벨의 위치
            subscribeNumLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            subscribeNumLabel.centerYAnchor.constraint(equalTo: blogSettingButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([ //"블로그 설정" 버튼의 위치
            blogSettingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            blogSettingButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            blogSettingButton.heightAnchor.constraint(equalToConstant: 30)
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
    
}
