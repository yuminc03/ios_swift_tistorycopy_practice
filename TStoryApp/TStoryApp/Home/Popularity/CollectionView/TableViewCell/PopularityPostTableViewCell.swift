//
//  PopularityPostTableViewCell.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/13.
//

import UIKit

class PopularityPostTableViewCell: UITableViewCell {
    
    lazy var rankingNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .red
        addSubview(label)
        return label
    } ()
    
    lazy var postTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        addSubview(label)
        return label
    } ()
    
    lazy var postViewsNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        addSubview(label)
        return label
    } ()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(separator)
        return separator
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
            rankingNumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rankingNumLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18)
        ])
        
        NSLayoutConstraint.activate([
            postTitlelabel.leadingAnchor.constraint(equalTo: rankingNumLabel.trailingAnchor, constant: 10),
            postTitlelabel.trailingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: -30),
            postTitlelabel.centerYAnchor.constraint(equalTo: rankingNumLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.widthAnchor.constraint(equalToConstant: 50),
            postImageView.heightAnchor.constraint(equalToConstant: 50),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            postViewsNumLabel.leadingAnchor.constraint(equalTo: postTitlelabel.leadingAnchor),
            postViewsNumLabel.topAnchor.constraint(equalTo: postTitlelabel.bottomAnchor, constant: 3),
            postViewsNumLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setPopularityPost(rank: Int, title: String, views: Int) {
        rankingNumLabel.text = String(rank)
        if title.count > 21 {
            let nsString = title as NSString
            let subTitle = nsString.substring(to: 20)
            postTitlelabel.text = subTitle + "・・・"
        }
        else {
            postTitlelabel.text = title
        }
        postViewsNumLabel.text = "조회 \(views)"
    }
}
