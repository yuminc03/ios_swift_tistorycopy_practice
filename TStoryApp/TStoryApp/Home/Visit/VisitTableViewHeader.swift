//
//  VisitHeaderView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//

import UIKit

class VisitTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var myBlogNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
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
            myBlogNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myBlogNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            myBlogNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
    
    func setVisitHeaderData(name: String) {
        myBlogNameLabel.text = name
    }
}
