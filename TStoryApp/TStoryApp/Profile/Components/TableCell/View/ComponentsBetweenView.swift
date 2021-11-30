//
//  ComponentsBetweenView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/30.
//

import UIKit

class ComponentsBetweenView: UIView {
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.backgroundColor = .lightGray.withAlphaComponent(0.3)
        
    }
}
