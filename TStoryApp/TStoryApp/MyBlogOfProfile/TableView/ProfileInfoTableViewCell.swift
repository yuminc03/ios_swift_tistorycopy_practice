//
//  ProfileInfoTableViewCell.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/17.
//

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {
    
    lazy var myBlogBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemPink
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myBlogBackgroundImageView.widthAnchor.constraint(equalToConstant: 25),
            myBlogBackgroundImageView.heightAnchor.constraint(equalToConstant: 25),
            myBlogBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myBlogBackgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            myBlogNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            myBlogNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            myBlogNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            myRepBlogCheckView.widthAnchor.constraint(equalToConstant: 20),
            myRepBlogCheckView.heightAnchor.constraint(equalToConstant: 20),
            myRepBlogCheckView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            myRepBlogCheckView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
}
