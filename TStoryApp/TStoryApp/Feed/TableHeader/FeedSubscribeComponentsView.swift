//
//  FeedSubscribeComponents.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/10.
//

import UIKit

class FeedSubscribeComponentsView: UIView {
    
    private var subscribeLabelComponent : String = ""
    private var subscribeNumComponent : Int = 0
    
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
        label.text = String(subscribeNumComponent)
        label.font = .systemFont(ofSize: 13)
        addSubview(label)
        return label
    } ()
    
    init(label: String, num: Int) {
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
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            numLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 2),
            numLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setNumLabelText(num: Int) {
        numLabel.text = String(num)
    }
}

