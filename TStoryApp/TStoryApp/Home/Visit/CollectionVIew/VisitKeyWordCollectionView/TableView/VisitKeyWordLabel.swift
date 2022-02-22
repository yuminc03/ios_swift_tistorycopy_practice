//
//  VisitKeyWordLabel.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit
 
class VisitKeyWordLabel: UILabel {
    
    private var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    init(inset: UIEdgeInsets) {
        super.init(frame: .zero)
        self.inset = inset
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: inset))
    }
    
    override var intrinsicContentSize: CGSize {
        var labelSize = super.intrinsicContentSize
        labelSize.width += inset.left + inset.right
        labelSize.height += inset.top + inset.bottom
        return labelSize
    }
    
    
}
