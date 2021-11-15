//
//  VisitKeyWordTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

class VisitKeyWordTableViewCell: UITableViewCell {
    
    lazy var visitKeyWords: VisitKeyWordLabel = {
        let label = VisitKeyWordLabel(inset: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 18
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
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
            visitKeyWords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            visitKeyWords.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            visitKeyWords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func setVisitKeyWordsText(keyWord: String, count: Int) {
        let text = "\(keyWord)  \(count)"
        let mutable = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of:"\(count)")
        mutable.addAttribute(.foregroundColor, value: UIColor.lightGray, range: range)
        visitKeyWords.attributedText = mutable
    }

}
