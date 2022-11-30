//
//  PassWordView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/07.
//

import UIKit

class PasswordSettingView: UIView {
    
    var password: String = ""
    
    lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var passwordSettingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "asdfasdfasd"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var passwordCopyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "복사"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        addSubview(label)
        return label
    } ()
    
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
            passwordTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordSettingLabel.trailingAnchor.constraint(equalTo: passwordCopyLabel.leadingAnchor, constant: -20),
            passwordSettingLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordCopyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordCopyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setPassword(text: String) {
        self.password = text
        passwordSettingLabel.text = password
    }
    
    func getPassword() -> String {
        return self.password
    }
}
