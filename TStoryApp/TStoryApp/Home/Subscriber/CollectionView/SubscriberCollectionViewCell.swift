//
//  SubscriberCollectionViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class SubscriberCollectionViewCell: UICollectionViewCell {
    
    lazy var blogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemCyan
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .systemOrange
        blogImageView.addSubview(imageView)
        return imageView
    } ()
    
    lazy var subscriberName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        blogImageView.addSubview(label)
        return label
    } ()
    
    lazy var subscriberBlogName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        blogImageView.addSubview(label)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            blogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blogImageView.topAnchor.constraint(equalTo: topAnchor),
            blogImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: -20),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            subscriberName.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            subscriberName.topAnchor.constraint(equalTo: topAnchor, constant: 110)
        ])
        
        NSLayoutConstraint.activate([
            subscriberBlogName.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            subscriberBlogName.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: -20),
            subscriberBlogName.topAnchor.constraint(equalTo: subscriberName.bottomAnchor, constant: 5),
            subscriberBlogName.bottomAnchor.constraint(equalTo: blogImageView.bottomAnchor, constant: -20)
        ])
    }
    
    func setSubscriberData(name: String, blogName: String) {
        subscriberName.text = name + "님의"
        subscriberBlogName.text = blogName
    }
}
