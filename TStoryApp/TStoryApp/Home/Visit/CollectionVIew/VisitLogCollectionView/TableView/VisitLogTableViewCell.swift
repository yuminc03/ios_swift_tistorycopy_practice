//
//  VisitLogTableViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/15.
//

import UIKit

class VisitLogTableViewCell: UITableViewCell {
    
    lazy var visitLogIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        addSubview(imageView)
        return imageView
    } ()
    
    lazy var visitLogUrl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        addSubview(label)
        return label
    } ()
    
    lazy var visitDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            visitLogIcon.widthAnchor.constraint(equalToConstant: 10),
            visitLogIcon.heightAnchor.constraint(equalToConstant: 10),
            visitLogIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            visitLogIcon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            visitLogIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            visitLogUrl.leadingAnchor.constraint(equalTo: visitLogIcon.trailingAnchor, constant: 8),
            visitLogUrl.trailingAnchor.constraint(equalTo: visitDate.leadingAnchor, constant: -10),
            visitLogUrl.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            visitDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            visitDate.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setComponentData(url: String, date: String) {
        visitLogUrl.text = url
        visitDate.text = date
    }
}
