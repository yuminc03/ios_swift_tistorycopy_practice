//
//  CategoryKindView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/27.
//

import UIKit

class CategoryKindView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
