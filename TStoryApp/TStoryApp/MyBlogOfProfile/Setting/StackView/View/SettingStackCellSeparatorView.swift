//
//  SettingStackCellSeparatorView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/18.
//

import UIKit

class SettingStackCellSeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.backgroundColor = .lightGray.withAlphaComponent(0.3)
    }
}
