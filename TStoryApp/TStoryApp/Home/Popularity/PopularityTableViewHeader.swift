//
//  PopularityHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/11.
//

import UIKit

class PopularityTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var popularityHeaderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "인기글"
        addSubview(label)
        return label
    } ()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("모두보기", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        addSubview(button)
        return button
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
            popularityHeaderTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            popularityHeaderTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            popularityHeaderTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            seeAllButton.centerYAnchor.constraint(equalTo: popularityHeaderTitleLabel.centerYAnchor)
        ])
    }
    
}
