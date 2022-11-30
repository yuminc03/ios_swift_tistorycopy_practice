//
//  TopView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/18.
//

import UIKit

class SettingTopView: UIView {
    
    lazy var dismissSettingViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var settingViewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dismissSettingViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissSettingViewButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dismissSettingViewButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            settingViewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            settingViewTitle.topAnchor.constraint(equalTo: dismissSettingViewButton.bottomAnchor, constant: 25)
        ])
    }
}
