//
//  NotificationSettingSeparatorView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/23.
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
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
