//
//  File.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/15.
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
