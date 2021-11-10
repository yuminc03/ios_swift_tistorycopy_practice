//
//  FeedSubscribeComponents.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/10.
//

import UIKit

class FeedSubscribeComponentsView: UIView {
    
    private var subscribeLabelComponent : String = ""
    private var subscribeNumComponent : String = ""
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = subscribeLabelComponent
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    private lazy var numLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = subscribeNumComponent
        label.font = .systemFont(ofSize: 13)
        addSubview(label)
        return label
    } ()
    
    init(label: String, num: String) {
        super.init(frame: .zero)
        self.subscribeLabelComponent = label
        self.subscribeNumComponent = num
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: topAnchor),
            topLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            numLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            numLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5),
            numLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

