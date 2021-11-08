//
//  File.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/07.
//

import UIKit

class HomeSubjectView: UIView {
    
    lazy var homeSubjectTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "홈주제"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var homeSubjectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("선택 안 함  〉", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        addSubview(button)
        return button
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
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            homeSubjectTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homeSubjectTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeSubjectButton.heightAnchor.constraint(equalToConstant: 30),
            homeSubjectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            homeSubjectButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
