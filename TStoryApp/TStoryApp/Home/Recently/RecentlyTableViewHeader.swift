//
//  RecentlyHeaderView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//

import UIKit

class RecentlyTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var recentlyHeaderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "최근글"
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
            recentlyHeaderTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlyHeaderTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            recentlyHeaderTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
