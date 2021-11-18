//
//  SettingCurrentTextLabel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class SettingCurrentTextLabel: UILabel {
    
    private var currentText: String = ""
    
    init(text: String) {
        self.currentText = text
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.text = currentText
        self.textColor = .lightGray
        self.font = .systemFont(ofSize: 12, weight: .light)
        self.lineBreakMode = .byTruncatingTail
        self.numberOfLines = 1
        
    }
    
}
