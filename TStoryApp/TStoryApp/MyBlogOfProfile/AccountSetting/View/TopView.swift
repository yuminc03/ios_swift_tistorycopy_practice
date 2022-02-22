//
//  TopView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class TopView: UIView {
    
    lazy var dismissAccountSettingViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dismissAccountSettingViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissAccountSettingViewButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            dismissAccountSettingViewButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
