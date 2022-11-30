//
//  CommentAllowView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/07.
//

import UIKit

class CommentAllowView: UIView {
    
    var commentAllow: Bool = true
    
    lazy var topSeperator: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        return seperator
    } ()
    
    lazy var commentAllowTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "댓글 허용"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var commentAllowSwitch: UISwitch = {
        let commentAllowSwitch = UISwitch()
        commentAllowSwitch.translatesAutoresizingMaskIntoConstraints = false
        commentAllowSwitch.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        commentAllowSwitch.tintColor = UIColor.lightGray
        commentAllowSwitch.onTintColor = UIColor.gray
        commentAllowSwitch.isOn = true
        addSubview(commentAllowSwitch)
        return commentAllowSwitch
    } ()
    
    lazy var bottomSeperator: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        return seperator
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
            topSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            topSeperator.topAnchor.constraint(equalTo: topAnchor),
            topSeperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            commentAllowTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            commentAllowTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentAllowSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            commentAllowSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setCommentAllow(allow: Bool) {
        self.commentAllow = allow
        commentAllowSwitch.isOn = allow
    }
    
    func getCommentAllow() -> Bool {
        if commentAllowSwitch.isOn {
            return true
        }
        else {
            return false
        }
    }
}
