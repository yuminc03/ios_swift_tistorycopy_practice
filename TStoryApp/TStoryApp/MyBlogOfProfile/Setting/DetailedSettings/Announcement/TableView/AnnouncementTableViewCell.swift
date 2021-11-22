//
//  AnnouncementTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {
    
    lazy var announcementTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        addSubview(label)
        return label
    } ()
    
    lazy var announcementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var likeComponents: AnnouncementCellComponents = {
        let component = AnnouncementCellComponents(number: 0, radius: 5)
        component.translatesAutoresizingMaskIntoConstraints = false
        addSubview(component)
        return component
    } ()
    
    lazy var componentDividedView: UIView = {
        let dividedView = UIView()
        dividedView.translatesAutoresizingMaskIntoConstraints = false
        dividedView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        dividedView.layer.cornerRadius = 1
        addSubview(dividedView)
        return dividedView
    } ()
    
    lazy var commentComponents: AnnouncementCellComponents = {
        let component = AnnouncementCellComponents(number: 0, radius: 3)
        component.translatesAutoresizingMaskIntoConstraints = false
        addSubview(component)
        return component
    } ()
    
    lazy var componentDividedSecondView: UIView = {
        let dividedView = UIView()
        dividedView.translatesAutoresizingMaskIntoConstraints = false
        dividedView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        dividedView.layer.cornerRadius = 1
        addSubview(dividedView)
        return dividedView
    } ()
    
    lazy var announcementDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
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
            announcementTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            announcementTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            announcementTitle.trailingAnchor.constraint(equalTo: announcementImageView.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            announcementImageView.widthAnchor.constraint(equalToConstant: 50),
            announcementImageView.heightAnchor.constraint(equalToConstant: 50),
            announcementImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            announcementImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likeComponents.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            likeComponents.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            componentDividedView.widthAnchor.constraint(equalToConstant: 2),
            componentDividedView.heightAnchor.constraint(equalToConstant: 2),
            componentDividedView.leadingAnchor.constraint(equalTo: likeComponents.trailingAnchor, constant: 5),
            componentDividedView.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentComponents.leadingAnchor.constraint(equalTo: componentDividedView.trailingAnchor, constant: 5),
            commentComponents.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            componentDividedSecondView.widthAnchor.constraint(equalToConstant: 2),
            componentDividedSecondView.heightAnchor.constraint(equalToConstant: 2),
            componentDividedSecondView.leadingAnchor.constraint(equalTo: commentComponents.trailingAnchor, constant: 5),
            componentDividedSecondView.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            announcementDate.leadingAnchor.constraint(equalTo: componentDividedSecondView.trailingAnchor, constant: 5),
            announcementDate.centerYAnchor.constraint(equalTo: likeComponents.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.3)
        ])
    }
    
    func setAnnouncementTableViewCell(title: String, likeNum: Int, commentNum: Int, date: String) {
        self.announcementTitle.text = title
        self.likeComponents.setAnnouncementCellComponents(num: likeNum)
        self.commentComponents.setAnnouncementCellComponents(num: commentNum)
        self.announcementDate.text = date
    }
}
