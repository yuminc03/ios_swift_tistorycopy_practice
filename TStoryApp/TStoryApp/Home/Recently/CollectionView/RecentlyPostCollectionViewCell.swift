//
//  RecentlyPostCollectionViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/12.
//

import UIKit

class RecentlyPostCollectionViewCell: UICollectionViewCell {
    
    var postUrl: String = ""
    
    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        addSubview(image)
        return image
    } ()
    
    lazy var postTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        
        if #available(iOS 14.0, *) {
            label.lineBreakStrategy = .hangulWordPriority
        } else {
            label.lineBreakStrategy = .pushOut
        }
        addSubview(label)
        return label
    } ()
    
    lazy var likeComponentView: PostComponentView = {
        let component = PostComponentView(radius: 6)
        component.translatesAutoresizingMaskIntoConstraints = false
        addSubview(component)
        return component
    } ()
    
    lazy var commentComponentView: PostComponentView = {
        let component = PostComponentView(radius: 3)
        component.translatesAutoresizingMaskIntoConstraints = false
        addSubview(component)
        return component
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
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImage.topAnchor.constraint(equalTo: topAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            postTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postTitle.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            likeComponentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            likeComponentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            commentComponentView.leadingAnchor.constraint(equalTo: likeComponentView.trailingAnchor, constant: 10),
            commentComponentView.centerYAnchor.constraint(equalTo: likeComponentView.centerYAnchor)
        ])
    }
    
    func setCommentNumLabel(title: String, likeNum: Int, commentNum: Int, postUrl: String) {
        postTitle.text = title
        likeComponentView.commentNumLabel.text = String(likeNum)
        commentComponentView.commentNumLabel.text = String(commentNum)
        self.postUrl = postUrl
    }
}
