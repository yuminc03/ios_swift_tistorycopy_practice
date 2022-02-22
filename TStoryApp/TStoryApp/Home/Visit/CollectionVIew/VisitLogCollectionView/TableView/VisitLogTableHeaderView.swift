//
//  VisitLogTableHeaderView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit

class VisitLogTableHeaderView: UITableViewHeaderFooterView {
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "유입 로그"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
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
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}
