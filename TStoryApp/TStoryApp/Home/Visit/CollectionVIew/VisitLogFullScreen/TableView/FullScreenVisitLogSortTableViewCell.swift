//
//  FullScreenVisitLogSortTableViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/17.
//

import UIKit

class FullScreenVisitLogSortTableViewCell: UITableViewCell {
    
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
    
    lazy var visitCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(separator)
        return separator
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
            visitLogIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            visitLogUrl.leadingAnchor.constraint(equalTo: visitLogIcon.trailingAnchor, constant: 5),
            visitLogUrl.trailingAnchor.constraint(lessThanOrEqualTo: visitCount.leadingAnchor, constant: -20),
            visitLogUrl.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            visitCount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            visitCount.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            visitCount.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setVisitLogSortData(url: String, count: Int) {
        self.visitLogUrl.text = url
        self.visitCount.text = String(count)
    }
    
    func subText(text: String) -> String {
        var subString = text
        if subString.count > 50 {
            let endIndex: String.Index = subString.index(subString.startIndex, offsetBy: 50)
            subString = String(subString[subString.startIndex ..< endIndex])
            subString += "・・・"
        }
        return subString
    }
}
