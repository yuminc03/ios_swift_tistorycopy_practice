//
//  repMarkLabel.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

class RepMarkLabel: UILabel {
    
    private var labelPadding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    
    init(padding: UIEdgeInsets) {
        super.init(frame: .zero)
        self.labelPadding = padding
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: labelPadding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += labelPadding.top + labelPadding.bottom
        contentSize.width += labelPadding.left + labelPadding.right
        
        return contentSize
    }
}
