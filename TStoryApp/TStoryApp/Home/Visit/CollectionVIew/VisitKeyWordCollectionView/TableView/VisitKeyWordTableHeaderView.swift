//
//  VisitKeyWordTableHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/15.
//

import UIKit

class VisitKeyWordTableHeaderView: UITableViewHeaderFooterView {
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "유입 키워드"
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
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
