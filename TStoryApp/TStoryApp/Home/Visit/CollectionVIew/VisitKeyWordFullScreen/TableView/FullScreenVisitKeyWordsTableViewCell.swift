//
//  FullScreenVisitKeyWordTableViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/16.
//

import UIKit

class FullScreenVisitKeyWordsTableViewCell: UITableViewCell {
    
    lazy var visitKeyWordsLabel: VisitKeyWordsLabel = {
        let label = VisitKeyWordsLabel(inset: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 18
        label.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
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
            visitKeyWordsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            visitKeyWordsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            visitKeyWordsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setVisitKeyWordsText(keyWord: String, count: Int) {
        let text = "\(keyWord)  \(count)"
        let mutable = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "\(count)")
        mutable.addAttribute(.foregroundColor, value: UIColor.lightGray, range: range)
        visitKeyWordsLabel.attributedText = mutable
    }
}
