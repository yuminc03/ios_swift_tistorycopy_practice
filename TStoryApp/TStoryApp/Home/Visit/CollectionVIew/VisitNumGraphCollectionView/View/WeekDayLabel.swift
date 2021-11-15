//
//  WeekDayLabel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

class WeekDayLabel: UILabel {
    
    var day: String = ""
    
    init(day: String) {
        super.init(frame: .zero)
        self.day = day
        textColor = .lightGray
        font = .systemFont(ofSize: 12, weight: .light)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
