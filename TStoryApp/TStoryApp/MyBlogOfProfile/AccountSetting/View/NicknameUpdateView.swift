//
//  nicknameUpdateView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class NicknameUpateView: UIView {
    
    lazy var topSeparator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        addSubview(separator)
        return separator
    } ()
    
    lazy var nicknameUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임 변경"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "〉"
        label.textColor = .lightGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 16)
        addSubview(label)
        return label
    } ()
    
    lazy var bottomSeparator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        addSubview(separator)
        return separator
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
            topSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            topSeparator.topAnchor.constraint(equalTo: topAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            nicknameUpdateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nicknameUpdateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nicknameUpdateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            arrowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            arrowLabel.centerYAnchor.constraint(equalTo: nicknameUpdateLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
