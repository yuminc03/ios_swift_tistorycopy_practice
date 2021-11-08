//
//  FeedTableViewHeader.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/28.
//

import UIKit

class FeedTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var noticeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.text = "알림"
        addSubview(label)
        return label
    }()
    
    lazy var noticeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        addSubview(button)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    func setNoticeButton(text: String) {
        noticeButton.setTitle(text, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            noticeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            noticeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            noticeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            noticeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            noticeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28)
        ])
    }
}
