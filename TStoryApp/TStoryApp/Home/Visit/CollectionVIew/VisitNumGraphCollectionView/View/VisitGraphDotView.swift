//
//  File.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

class VisitGraphDotView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
