//
//  VisitHeaderComponentsView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/11.
//

import UIKit

class VisitCellComponentsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 4),
            self.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    func setUI(isSelected: Bool) {
        self.backgroundColor = isSelected ? .gray : .lightGray.withAlphaComponent(0.5)
    }
    
}
