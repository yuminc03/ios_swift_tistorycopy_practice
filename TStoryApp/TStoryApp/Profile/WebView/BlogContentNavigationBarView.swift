//
//  BlogContentNavigationBarView.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/23.
//

import UIKit

class BlogContentNavigationBarView: UIView {
    
    let previousButton = UIButton()
    let profileButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     
    private func setupView() {
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.backgroundColor = .clear
        previousButton.setImage(UIImage(named: "caret-left-thin"), for: .normal)
        self.addSubview(previousButton)
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.backgroundColor = .black
        profileButton.layer.cornerRadius = 15
        profileButton.clipsToBounds = true
        profileButton.setImage(UIImage(named: "blog-image"), for: .normal)
        self.addSubview(profileButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            previousButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            previousButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            previousButton.heightAnchor.constraint(equalToConstant: 30),
            previousButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            profileButton.centerYAnchor.constraint(equalTo: previousButton.centerYAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 30),
            profileButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
