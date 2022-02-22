//
//  ChangeNicknameTopView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/19.
//

import UIKit

class ChangeNicknameTopView: UIView {
    
    lazy var dismissChangeNicknameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임 변경"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        addSubview(label)
        return label
    } ()
    
    lazy var saveChangeNicknameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.lightGray.withAlphaComponent(0.8), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        button.layer.borderWidth = 0.5
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 15
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
            dismissChangeNicknameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissChangeNicknameButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            viewTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            saveChangeNicknameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveChangeNicknameButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            saveChangeNicknameButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
