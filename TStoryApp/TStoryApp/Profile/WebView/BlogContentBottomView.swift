//
//  BlogContentBottomView.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/23.
//

import UIKit

class BlogContentBottomView: UIView {
    
    let likeButton = UIButton()
    let likeCountLabel = UILabel()
    let commentButton = UIButton()
    let commentCountLabel = UILabel()
    let shareButton = UIButton()
    let menuButton = UIButton()
    let separator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.backgroundColor = .black
        self.addSubview(likeButton)
        
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.text = "0"
        likeCountLabel.textColor = .black
        likeCountLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.addSubview(likeCountLabel)
        
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.backgroundColor = .black
        self.addSubview(commentButton)
        
        commentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        commentCountLabel.text = "0"
        commentCountLabel.textColor = .black
        commentCountLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.addSubview(commentCountLabel)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.backgroundColor = .black
        self.addSubview(shareButton)
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.backgroundColor = .black
        self.addSubview(menuButton)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.8)
        self.addSubview(separator)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            likeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            likeCountLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),
            likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentButton.widthAnchor.constraint(equalToConstant: 20),
            commentButton.heightAnchor.constraint(equalToConstant: 20),
            commentButton.leadingAnchor.constraint(equalTo: likeCountLabel.trailingAnchor, constant: 20),
            commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentCountLabel.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10),
            commentCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            shareButton.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -20),
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 20),
            menuButton.heightAnchor.constraint(equalToConstant: 20),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            menuButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separator.topAnchor.constraint(equalTo: self.topAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
