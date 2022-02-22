//
//  SettingProfileImageView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class SettingProfileImageView: UIImageView {
    
    private var imageRadius: Int = 0
    private var imageColorNum: Int = 0
    
    init(imageRadius: Int, colorNum: Int) {
        self.imageRadius = imageRadius
        self.imageColorNum = colorNum
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.backgroundColor = imageColorNum == 0 ? .systemPurple.withAlphaComponent(0.8) : .systemBlue.withAlphaComponent(0.8)
        self.layer.cornerRadius = CGFloat(imageRadius)
    }
}
