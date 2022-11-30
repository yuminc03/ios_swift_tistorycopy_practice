//
//  FeedCommentsComponentsView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/10.
//

import UIKit

class FeedCommentsCompotentsView: UIView {

    private var numText: Int = 0
    private var cornerRadiusValue: Int = 0
    
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
        label.font = .systemFont(ofSize: 12, weight: .light)
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
            leftIconView.widthAnchor.constraint(equalToConstant: 12),
            leftIconView.heightAnchor.constraint(equalToConstant: 12),
            leftIconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftIconView.topAnchor.constraint(equalTo: topAnchor),
            leftIconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rightNumberLabel.leadingAnchor.constraint(equalTo: leftIconView.trailingAnchor, constant: 5),
            rightNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightNumberLabel.centerYAnchor.constraint(equalTo: leftIconView.centerYAnchor)
        ])
    }
    
    func setNumberText(num: Int) {
        rightNumberLabel.text = String(num)
    }
}
