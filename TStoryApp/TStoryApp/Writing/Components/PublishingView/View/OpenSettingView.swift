//
//  OpenSettingView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/01.
//

import UIKit

class OpenSettingView: UIView{
    
    var writeFormModel : [WriteFormModel] = []
    
    lazy var openSettingTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "공개 설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    }()
    
    lazy var openSettingOpenView: UIView = {
        let publicView = UIView()
        publicView.translatesAutoresizingMaskIntoConstraints = false
        publicView.backgroundColor = .lightGray
        publicView.layer.cornerRadius = 10
        publicView.tag = 0
        addSubview(publicView)
        return publicView
    }()
    
    lazy var openSettingOpenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "공개"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.tag = 1
        addSubview(label)
        return label
    }()
    
    lazy var openSettingProtectView: UIView = {
        let protectView = UIView()
        protectView.translatesAutoresizingMaskIntoConstraints = false
        protectView.backgroundColor = .lightGray
        protectView.layer.cornerRadius = 10
        protectView.tag = 2
        addSubview(protectView)
        return protectView
    }()
    
    lazy var openSettingProtectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "보호"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.tag = 3
        addSubview(label)
        return label
    }()
    
    lazy var openSettingPrivateView: UIView = {
        let privateView = UIView()
        privateView.translatesAutoresizingMaskIntoConstraints = false
        privateView.backgroundColor = .lightGray
        privateView.layer.cornerRadius = 10
        privateView.tag = 4
        addSubview(privateView)
        return privateView
    }()
    
    lazy var openSettingPrivateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비공개"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.tag = 5
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            openSettingTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            openSettingTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            openSettingOpenView.widthAnchor.constraint(equalToConstant: 20),
            openSettingOpenView.heightAnchor.constraint(equalToConstant: 20),
            openSettingOpenView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
            openSettingOpenView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            openSettingOpenLabel.centerXAnchor.constraint(equalTo: openSettingOpenView.centerXAnchor),
            openSettingOpenLabel.topAnchor.constraint(equalTo: openSettingOpenView.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            openSettingProtectView.widthAnchor.constraint(equalToConstant: 20),
            openSettingProtectView.heightAnchor.constraint(equalToConstant: 20),
            openSettingProtectView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            openSettingProtectView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            openSettingProtectLabel.centerXAnchor.constraint(equalTo: openSettingProtectView.centerXAnchor),
            openSettingProtectLabel.topAnchor.constraint(equalTo: openSettingProtectView.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            openSettingPrivateView.widthAnchor.constraint(equalToConstant: 20),
            openSettingPrivateView.heightAnchor.constraint(equalToConstant: 20),
            openSettingPrivateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            openSettingPrivateView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            openSettingPrivateLabel.centerXAnchor.constraint(equalTo: openSettingPrivateView.centerXAnchor),
            openSettingPrivateLabel.topAnchor.constraint(equalTo: openSettingPrivateView.bottomAnchor, constant: 5)
        ])
    }
    
    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setOpenSettingIndex(index: Int) {
        self.writeFormModel[0].publishSettingForm[0].publishSettingIndex = index
    }
    
}
