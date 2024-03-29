//
//  TopHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/11.
//

import UIKit

class TopHeaderView: UITableViewHeaderFooterView {
    
    lazy var topContentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 14.0, *) {
            label.lineBreakStrategy = .hangulWordPriority
        } else {
            label.lineBreakStrategy = .pushOut
        }
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .black
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
            topContentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topContentTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            topContentTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            topContentTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func setTopContent(text: String) {
        topContentTitleLabel.text = text
    }
}
