//
//  PublishingHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/01.
//

import UIKit

class PublishingHeaderView: UIView {
    
    lazy var settingBackView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .red
        backView.layer.cornerRadius = 10
        backView.isUserInteractionEnabled = true
        addSubview(backView)
        return backView
    }()
    
    lazy var settingTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "발행 설정"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    lazy var settingCompletionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("발행", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 18
        addSubview(button)
        return button
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
            settingBackView.widthAnchor.constraint(equalToConstant: 20),
            settingBackView.heightAnchor.constraint(equalToConstant: 20),
            settingBackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            settingBackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingCompletionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            settingCompletionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingCompletionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
}
