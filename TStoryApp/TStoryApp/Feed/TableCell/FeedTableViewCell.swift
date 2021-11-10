//
//  FeedTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/10.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var likeNumLabel: Int = 0
    var commentNumLabel: Int = 0
    
    lazy var feedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.lineBreakMode = .byCharWrapping
        addSubview(label)
        return label
    } ()
    
    lazy var feedContentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        addSubview(label)
        return label
    } ()
    
    lazy var feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple.withAlphaComponent(0.5)
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var likeComponents: FeedCommentsCompotentsView = {
        let likeComponents = FeedCommentsCompotentsView(numText: likeNumLabel, cornerRadiusValue: 10)
        likeComponents.translatesAutoresizingMaskIntoConstraints = false
        addSubview(likeComponents)
        return likeComponents
    } ()
    
    lazy var commentComponents: FeedCommentsCompotentsView = {
        let commentComponents = FeedCommentsCompotentsView(numText: commentNumLabel, cornerRadiusValue: 5)
        commentComponents.translatesAutoresizingMaskIntoConstraints = false
        addSubview(commentComponents)
        return commentComponents
    } ()
    
    lazy var feedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var subscribingProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue.withAlphaComponent(0.8)
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var subscribingBloggerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .light)
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
            feedTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            feedTitleLabel.bottomAnchor.constraint(equalTo: feedContentsLabel.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            feedContentsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedContentsLabel.trailingAnchor.constraint(equalTo: feedImageView.leadingAnchor, constant: -20),
            feedContentsLabel.bottomAnchor.constraint(equalTo: likeComponents.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            feedImageView.widthAnchor.constraint(equalToConstant: 100),
            feedImageView.heightAnchor.constraint(equalToConstant: 100),
            feedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            feedImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            likeComponents.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            likeComponents.bottomAnchor.constraint(equalTo: subscribingProfileImageView.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            commentComponents.leadingAnchor.constraint(equalTo: likeComponents.trailingAnchor, constant: 15),
            commentComponents.bottomAnchor.constraint(equalTo: subscribingProfileImageView.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            feedDateLabel.leadingAnchor.constraint(equalTo: commentComponents.trailingAnchor, constant: 15),
            feedDateLabel.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subscribingProfileImageView.widthAnchor.constraint(equalToConstant: 30),
            subscribingProfileImageView.heightAnchor.constraint(equalToConstant: 30),
            subscribingProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
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
    
    func setFeedTableViewCellData(title: String, contents: String, likeNum: Int, commentNum: Int, date: String, name: String) {
        feedTitleLabel.text = title
        feedContentsLabel.text = contents
        self.likeNumLabel = likeNum
        self.commentNumLabel = commentNum
        feedDateLabel.text = date
        subscribingBloggerName.text = name
    }
}
