//
//  FeedCommentsComponentsView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/10.
//

import UIKit

class FeedCommentsCompotentsView: UIView {

    var numText: Int = 0
    var cornerRadiusValue: Int = 0
    
    lazy var leftIconView: UIView = {
        let leftIconView = UIView()
        leftIconView.translatesAutoresizingMaskIntoConstraints = false
        leftIconView.backgroundColor = .lightGray
        leftIconView.layer.cornerRadius = CGFloat(cornerRadiusValue)
        addSubview(leftIconView)
        return leftIconView
    } ()
    
    lazy var rightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = String(numText)
        addSubview(label)
        return label
    } ()
    
    init(numText: Int, cornerRadiusValue: Int) {
        super.init(frame: .zero)
        self.numText = numText
        self.cornerRadiusValue = cornerRadiusValue
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            leftIconView.widthAnchor.constraint(equalToConstant: 20),
            leftIconView.heightAnchor.constraint(equalToConstant: 20),
            leftIconView.trailingAnchor.constraint(equalTo: rightNumberLabel.leadingAnchor, constant: 5),
            leftIconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rightNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightNumberLabel.centerYAnchor.constraint(equalTo: leftIconView.centerYAnchor)
        ])
    }
}
