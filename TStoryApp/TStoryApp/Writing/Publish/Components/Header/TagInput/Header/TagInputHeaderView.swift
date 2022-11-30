//
//  TagInputHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/08.
//

import UIKit

class TagInputHeaderView: UIView {
    
    lazy var tagInputExitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("✕", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var TitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "태그 입력"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    lazy var tagInputCompletionButton: UIButton = {
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
    
    lazy var seperator: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        return seperator
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
            tagInputExitButton.widthAnchor.constraint(equalToConstant: 20),
            tagInputExitButton.heightAnchor.constraint(equalToConstant: 20),
            tagInputExitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagInputExitButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            TitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            TitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tagInputCompletionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagInputCompletionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            tagInputCompletionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 0.5),
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
