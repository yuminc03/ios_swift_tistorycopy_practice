//
//  PostContentsTagSettingHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/03.
//

import UIKit

class PostContentsTagSettingHeaderView: UIView {
    
    lazy var tagSettingBackView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .red
        backView.layer.cornerRadius = 10
        backView.isUserInteractionEnabled = true
        addSubview(backView)
        return backView
    }()
    
    lazy var tagSettingTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "태그 입력"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    lazy var tagSettingCompletionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
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
        backgroundColor = .white
        NSLayoutConstraint.activate([
            tagSettingBackView.widthAnchor.constraint(equalToConstant: 20),
            tagSettingBackView.heightAnchor.constraint(equalToConstant: 20),
            tagSettingBackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagSettingBackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tagSettingTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tagSettingTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tagSettingCompletionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagSettingCompletionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            tagSettingCompletionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
}
