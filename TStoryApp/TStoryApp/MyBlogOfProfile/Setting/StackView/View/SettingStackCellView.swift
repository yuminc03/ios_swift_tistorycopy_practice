//
//  SettingStackCellView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class SettingStackCellView: UIView {
    
    private var settingName: String = ""
    
    private lazy var settingNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = settingName
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    private lazy var settingArrowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "〉"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    init(name: String) {
        super.init(frame: .zero)
        self.settingName = name
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            settingNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            settingNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            settingNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            settingArrowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            settingArrowLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
