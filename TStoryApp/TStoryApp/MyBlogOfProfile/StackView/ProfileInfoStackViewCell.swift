//
//  ProfileInfoTableViewCell.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/17.
//

import UIKit

class ProfileInfoStackViewCell: UIView {
    
    lazy var myBlogBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        imageView.layer.cornerRadius = 3
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var myBlogNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 1
        addSubview(label)
        return label
    } ()
    
    lazy var myRepBlogCheckView: UIView = {
        let checkView = UIView()
        checkView.translatesAutoresizingMaskIntoConstraints = false
        checkView.backgroundColor = .clear
        checkView.layer.cornerRadius = 10
        addSubview(checkView)
        return checkView
    } ()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.5)
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
            myBlogBackgroundImageView.widthAnchor.constraint(equalToConstant: 25),
            myBlogBackgroundImageView.heightAnchor.constraint(equalToConstant: 25),
            myBlogBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            myBlogBackgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            myBlogNameLabel.leadingAnchor.constraint(equalTo: myBlogBackgroundImageView.trailingAnchor, constant: 15),
            myBlogNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            myBlogNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            myRepBlogCheckView.widthAnchor.constraint(equalToConstant: 20),
            myRepBlogCheckView.heightAnchor.constraint(equalToConstant: 20),
            myRepBlogCheckView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            myRepBlogCheckView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setProfileInfoTableViewCell(name: String) {
        myBlogNameLabel.text = name
    }
}
