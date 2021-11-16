//
//  VisitHeaderComponentsView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class VisitHeaderComponentsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 6),
            self.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    func setUI(isSelected: Bool) {
        self.backgroundColor = isSelected ? .gray : .lightGray.withAlphaComponent(0.5)
    }
    
}
