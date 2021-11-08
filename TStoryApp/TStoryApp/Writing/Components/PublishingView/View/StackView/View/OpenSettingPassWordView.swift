//
//  OpenSettingPassWordView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/04.
//

import UIKit

class OpenSettingPassWordView: UIView {
    
    lazy var passWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    }()
    
    lazy var passWordContentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "YzExZDMx"
        label.textColor = .gray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        addSubview(label)
        return label
    }()
    
    lazy var passWordCopyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("복사", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
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
            passWordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passWordLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            passWordContentsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
            passWordContentsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            passWordCopyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passWordCopyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            passWordCopyButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let line = devidedLineViewFunc()
        self.addSubview(line)
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setPassWord(text: String) {
        passWordContentsLabel.text = text
    }
}
