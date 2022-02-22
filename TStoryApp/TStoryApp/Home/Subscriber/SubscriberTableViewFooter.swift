//
//  SubscriberFooterView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//

import UIKit

class SubscriberTableViewFooter: UITableViewHeaderFooterView {
    
    lazy var home: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        let heartIcon = "♥︎"
        let text = "티스토리는 카카오에서 " + heartIcon + "를 담아 만듭니다."
        let mutable = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: heartIcon)
        mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        label.attributedText = mutable
        addSubview(label)
        return label
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setconstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setconstraints() {
        NSLayoutConstraint.activate([
            home.centerYAnchor.constraint(equalTo: centerYAnchor),
            home.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
