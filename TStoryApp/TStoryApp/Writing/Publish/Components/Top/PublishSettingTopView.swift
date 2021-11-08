//
//  PublishSettingTopView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/07.
//

import UIKit

class PublishSettingTopView: UIView {
    
    lazy var previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "발행 설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var publishingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("발행", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
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
            previousButton.heightAnchor.constraint(equalToConstant: 40),
            previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            previousButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            topTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            publishingButton.heightAnchor.constraint(equalToConstant: 30),
            publishingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            publishingButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
