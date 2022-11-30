//
//  FeedComponentsBetweenView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/11.
//

import UIKit

class FeedComponentsBetweenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        self.backgroundColor = .lightGray.withAlphaComponent(0.5)
        self.layer.cornerRadius = 1
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 2),
            self.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
