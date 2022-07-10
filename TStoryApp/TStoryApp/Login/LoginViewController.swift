//
//  LoginViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2022/07/10.
//

import UIKit


class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let tistoryLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "TISTORY"
        titleLabel.textColor = UIColor.black
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        tistoryLoginButton.translatesAutoresizingMaskIntoConstraints = false
        tistoryLoginButton.backgroundColor = .white
        tistoryLoginButton.layer.borderColor = UIColor.black.cgColor
        tistoryLoginButton.layer.borderWidth = 1
        tistoryLoginButton.setTitleColor(UIColor.black, for: .normal)
        tistoryLoginButton.setTitle("티스토리계정 로그인", for: .normal)
        tistoryLoginButton.titleLabel?.font = .systemFont(ofSize: 20)
        self.view.addSubview(tistoryLoginButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tistoryLoginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tistoryLoginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tistoryLoginButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            tistoryLoginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
