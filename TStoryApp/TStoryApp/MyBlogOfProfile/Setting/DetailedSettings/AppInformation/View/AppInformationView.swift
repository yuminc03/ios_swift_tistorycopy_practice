//
//  AppInformationView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class AppInformationView: UIView {
    
    var appVersion: String = ""
    
    lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        imageView.layer.borderWidth = 1
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TISTORY"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        addSubview(label)
        return label
    } ()
    
    lazy var currentAppVersion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "현재 버전 \(self.appVersion)"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var recentAppVersion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최신 버전 2.4.7"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var appUpdateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.appVersion == "2.4.8" ? "촤신 버전 사용 중" : "업데이트", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        button.backgroundColor = self.appVersion == "2.4.8" ? .white : .black
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100)
        addSubview(button)
        return button
    } ()
    
    lazy var companyNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "© Kakao Corp."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .light)
        addSubview(label)
        return label
    } ()
    
    init(appVersion: String) {
        super.init(frame: .zero)
        self.appVersion = appVersion
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            appImageView.widthAnchor.constraint(equalToConstant: 100),
            appImageView.heightAnchor.constraint(equalToConstant: 100),
            appImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            appImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: appImageView.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            currentAppVersion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
            currentAppVersion.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            recentAppVersion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -110),
            recentAppVersion.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            appUpdateButton.topAnchor.constraint(equalTo: recentAppVersion.bottomAnchor, constant: 30),
            appUpdateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            appUpdateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            companyNameLabel.centerXAnchor.constraint(equalTo: appImageView.centerXAnchor),
            companyNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30)
        ])
    }
    
}
