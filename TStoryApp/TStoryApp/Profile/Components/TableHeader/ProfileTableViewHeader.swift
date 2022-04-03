//
//  ProfileTableViewHeaderFooterView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/26.
//

import UIKit

class ProfileTableViewHeader: UITableViewHeaderFooterView {
    
    var model = ProfileModel()
    var subscribeNum = 0
    var profileUrl = ""
    
    var titleLabel = UILabel()
    var siteUrlButton = UIButton()
    var profileImageView = UIImageView()
    var subscribeLabel = UILabel()
    var settingButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func siteUrlButtonDidTrapped(button: UIButton) {//button 하나에 한 개의 액션이면 ()안에 안써도 괜찮음
        //print("motion button")
        if let url = URL(string: profileUrl),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func settingButtonDidTrapped(button: UIButton) {
        //print("touched")
    }
    
    private func setupView() {
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.image = UIImage(named: "profile_image")//data //image를 넣는다
        profileImageView.backgroundColor = .black
        profileImageView.clipsToBounds = true //이미지가 화면을 벗어났을 때 표현안함
        //imageView.layer.masksToBounds = true
        profileImageView.layer.maskedCorners = [.layerMaxXMaxYCorner]//image의 x, y 끝 좌표
        profileImageView.layer.cornerRadius = 50
        profileImageView.isUserInteractionEnabled = true// 투명한 view를 뚫어서 버튼을 누를 수 있게 한다
        self.addSubview(profileImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textColor = .white
        titleLabel.text = model.profileTitle
        profileImageView.addSubview(titleLabel)
        
        siteUrlButton.translatesAutoresizingMaskIntoConstraints = false
        siteUrlButton.setTitle(model.profileUrl, for: .normal)
        siteUrlButton.setTitleColor(.white, for: .normal)
        siteUrlButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        siteUrlButton.addTarget(self, action: #selector(siteUrlButtonDidTrapped), for: .touchUpInside)
        profileImageView.addSubview(siteUrlButton)
        
        subscribeLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribeLabel.font = UIFont.systemFont(ofSize: 10)
        subscribeLabel.textColor = .lightGray
        let text = "구독자 " + "\(subscribeNum)"
        let mutable = NSMutableAttributedString(string: text)//text의 색깔을 바꾼다
        let range = (text as NSString).range(of: "\(subscribeNum)")
        mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)//1개만
        subscribeLabel.attributedText = mutable
        self.addSubview(subscribeLabel)
        
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        //border
        settingButton.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        settingButton.layer.borderWidth = 1
        // radius
        settingButton.layer.cornerRadius = 15
        //button text set
        settingButton.setTitle("블로그 설정", for: .normal)
        settingButton.setTitleColor(.black, for: .normal)
        settingButton.titleLabel?.font = .systemFont(ofSize: 12)
        
//        if #available(iOS 15.0, *) {
//
//            settingButton.configuration?.titlePadding = 10
//        } else {
//
        settingButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//        }
        settingButton.addTarget(self, action: #selector(settingButtonDidTrapped), for: .touchUpInside)
        self.addSubview(settingButton)
        
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([ //프로필 이미지의 위치
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([ //"구독자" 라벨의 위치
            subscribeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            subscribeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50),
            subscribeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([ //"블로그 설정" 버튼의 위치
            settingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            settingButton.centerYAnchor.constraint(equalTo: subscribeLabel.centerYAnchor),
            settingButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([ //"사이트 주소" 버튼의 위치 (프로필 이미지의 위에 배치)
            siteUrlButton.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            siteUrlButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([ //사이트의 제목 라벨의 위치 (프로필 이미지 위에 배치, 사이트 주소 버튼 위쪽에 배치)
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: siteUrlButton.topAnchor, constant: -10)
        ])
    }
}
