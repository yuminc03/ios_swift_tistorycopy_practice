//
//  AnnouncementCellComponents.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

import UIKit

class AnnouncementCellComponents: UIView {
    
    var number: Int = 0
    var viewRadius: Int = 0
    
    lazy var iconView: UIView = {
        let likeView = UIView()
        likeView.translatesAutoresizingMaskIntoConstraints = false
        likeView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        likeView.layer.cornerRadius = CGFloat(viewRadius)
        addSubview(likeView)
        return likeView
    } ()
    
    lazy var numLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = String(number)
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()

    
    init(number: Int, radius: Int) {
        super.init(frame: .zero)
        self.number = number
        self.viewRadius = radius
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 10),
            iconView.heightAnchor.constraint(equalToConstant: 10),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 5),
            numLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ])
    }
    
    func setAnnouncementCellComponents(num: Int) {
        self.numLabel.text = String(num)
    }
}
