//
//  RepBlogSettingTableViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/19.
//

import UIKit

class RepBlogSettingTableViewCell: UITableViewCell {
    
    lazy var blogBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        imageView.layer.cornerRadius = 5
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var blogTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        addSubview(label)
        return label
    } ()
    
    lazy var blogUrlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        addSubview(label)
        return label
    } ()
    
    lazy var repMarkLabel: RepMarkLabel = {
        let label = RepMarkLabel(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray.withAlphaComponent(0.3)
        label.text = "대표"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        addSubview(label)
        return label
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
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            blogBackgroundImageView.widthAnchor.constraint(equalToConstant: 30),
            blogBackgroundImageView.heightAnchor.constraint(equalToConstant: 30),
            blogBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            blogBackgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            blogTitleLabel.leadingAnchor.constraint(equalTo: blogBackgroundImageView.trailingAnchor, constant: 15),
            blogTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            blogUrlLabel.leadingAnchor.constraint(equalTo: blogBackgroundImageView.trailingAnchor, constant: 15),
            blogUrlLabel.topAnchor.constraint(equalTo: blogTitleLabel.bottomAnchor, constant: 5),
            blogUrlLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            repMarkLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            repMarkLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            repMarkLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setRepBlogSettingTableViewCell(blogName: String, blogUrl: String){
        self.blogTitleLabel.text = blogName
        self.blogUrlLabel.text = blogUrl
    }
}
