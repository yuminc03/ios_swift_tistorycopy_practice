//
//  PostComponentView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class PostComponentView: UIView {
    
    var viewRadius: Int = 0
    
    lazy var commentView: UIView = {
        let commentView = UIView()
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.backgroundColor = .lightGray.withAlphaComponent(0.8)
        commentView.layer.cornerRadius = CGFloat(viewRadius)
        addSubview(commentView)
        return commentView
    } ()
    
    lazy var commentNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray.withAlphaComponent(0.8)
        addSubview(label)
        return label
    } ()
    
    init(radius: Int) {
        super.init(frame: .zero)
        self.viewRadius = radius
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            commentView.widthAnchor.constraint(equalToConstant: 12),
            commentView.heightAnchor.constraint(equalToConstant: 12),
            commentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commentView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentNumLabel.leadingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: 3),
            commentNumLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentNumLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor)
        ])
    }
    
}
