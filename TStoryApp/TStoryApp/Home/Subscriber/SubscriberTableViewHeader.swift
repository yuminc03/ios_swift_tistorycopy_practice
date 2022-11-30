//
//  SubscriberHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/11.
//

import UIKit

class SubscriberTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var subscriberHeaderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "내 블로그 구독자"
        addSubview(label)
        return label
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            subscriberHeaderTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subscriberHeaderTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            subscriberHeaderTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
