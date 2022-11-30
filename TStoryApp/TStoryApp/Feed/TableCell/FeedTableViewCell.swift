//
//  FeedTableViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/10.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    lazy var feedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 2
        
        if #available(iOS 14.0, *) {
            
            label.lineBreakStrategy = .hangulWordPriority
        } else {
            
            label.lineBreakStrategy = .pushOut
        }
        label.lineBreakMode = .byTruncatingTail
        addSubview(label)
        return label
    } ()
    
    lazy var feedContentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        
        if #available(iOS 14.0, *) {
            label.lineBreakStrategy = .hangulWordPriority
        } else {
            label.lineBreakStrategy = .pushOut
        }
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        addSubview(label)
        return label
    } ()
    
    lazy var feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue.withAlphaComponent(0.5)
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        imageView.layer.borderWidth = 0.5
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var likeComponents: FeedCommentsCompotentsView = {
        let likeComponents = FeedCommentsCompotentsView(numText: 0, cornerRadiusValue: 6)
        likeComponents.translatesAutoresizingMaskIntoConstraints = false
        addSubview(likeComponents)
        return likeComponents
    } ()
    
    lazy var componentsBetweenView: FeedComponentsBetweenView = {
        let componentsBetweenView = FeedComponentsBetweenView()
        componentsBetweenView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(componentsBetweenView)
        return componentsBetweenView
    } ()
    
    lazy var commentComponents: FeedCommentsCompotentsView = {
        let commentComponents = FeedCommentsCompotentsView(numText: 0, cornerRadiusValue: 3)
        commentComponents.translatesAutoresizingMaskIntoConstraints = false
        addSubview(commentComponents)
        return commentComponents
    } ()
    
    lazy var componentsBetweenView2: FeedComponentsBetweenView = {
        let componentsBetweenView = FeedComponentsBetweenView()
        componentsBetweenView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(componentsBetweenView)
        return componentsBetweenView
    } ()
    
    lazy var feedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var subscribingProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue.withAlphaComponent(0.8)
        imageView.layer.cornerRadius = 5
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var subscribingBloggerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var seperator: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        return seperator
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
            feedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedTitleLabel.trailingAnchor.constraint(equalTo: feedImageView.leadingAnchor, constant: -20),
            feedTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            feedContentsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedContentsLabel.trailingAnchor.constraint(equalTo: feedImageView.leadingAnchor, constant: -20),
            feedContentsLabel.topAnchor.constraint(equalTo: feedTitleLabel.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            feedImageView.widthAnchor.constraint(equalToConstant: 100),
            feedImageView.heightAnchor.constraint(equalToConstant: 100),
            feedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            feedImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            likeComponents.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            likeComponents.topAnchor.constraint(equalTo: feedContentsLabel.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            componentsBetweenView.leadingAnchor.constraint(equalTo: likeComponents.trailingAnchor, constant: 6),
            componentsBetweenView.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentComponents.leadingAnchor.constraint(equalTo: componentsBetweenView.trailingAnchor, constant: 6),
            commentComponents.bottomAnchor.constraint(equalTo: subscribingProfileImageView.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            componentsBetweenView2.leadingAnchor.constraint(equalTo: commentComponents.trailingAnchor, constant: 6),
            componentsBetweenView2.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            feedDateLabel.leadingAnchor.constraint(equalTo: componentsBetweenView2.trailingAnchor, constant: 12),
            feedDateLabel.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subscribingProfileImageView.widthAnchor.constraint(equalToConstant: 20),
            subscribingProfileImageView.heightAnchor.constraint(equalToConstant: 20),
            subscribingProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subscribingProfileImageView.topAnchor.constraint(equalTo: likeComponents.bottomAnchor, constant: 15),
            subscribingProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            subscribingBloggerName.leadingAnchor.constraint(equalTo: subscribingProfileImageView.trailingAnchor, constant: 10),
            subscribingBloggerName.centerYAnchor.constraint(equalTo: subscribingProfileImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setFeedTableViewCellData(title: String, contents: String, date: String, name: String) {
        feedTitleLabel.text = title
        feedContentsLabel.text = contents
        feedDateLabel.text = date
        subscribingBloggerName.text = name
    }
    
    func setNumberComponentText(likeNum: Int, commentNum: Int) {
        likeComponents.setNumberText(num: likeNum)
        commentComponents.setNumberText(num: commentNum)
    }
}
