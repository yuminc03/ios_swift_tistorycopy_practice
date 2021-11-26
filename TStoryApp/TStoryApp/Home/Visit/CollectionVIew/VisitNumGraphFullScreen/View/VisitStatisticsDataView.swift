//
//  VisitChannelView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/25.
//

import UIKit

class VisitStatisticsDataView: UIView {
    
    var viewTitle: String = ""
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = viewTitle
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        addSubview(label)
        return label
    } ()
    
    init(title: String) {
        super.init(frame: .zero)
        self.viewTitle = title
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
    }
}
