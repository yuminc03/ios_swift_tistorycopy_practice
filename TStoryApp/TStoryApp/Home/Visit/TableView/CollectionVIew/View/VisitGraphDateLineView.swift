//
//  VisitGraphDateLineView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class VisitGraphDateLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        backgroundColor = .lightGray.withAlphaComponent(0.5)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 1),
            self.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
