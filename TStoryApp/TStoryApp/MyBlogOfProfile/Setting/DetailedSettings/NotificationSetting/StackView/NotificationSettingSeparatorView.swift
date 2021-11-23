//
//  NotificationSettingSeparatorView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/23.
//

import UIKit

class NotificationSettingSeparatorView: UIView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        self.backgroundColor = .lightGray.withAlphaComponent(0.3)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
