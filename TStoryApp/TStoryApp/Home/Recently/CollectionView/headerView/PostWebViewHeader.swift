//
//  PostWebViewHeader.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/15.
//

import UIKit

class PostWebViewHeader: UIView {
    
    lazy var backToHomeButton: UIButton = {
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
            backToHomeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backToHomeButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backToHomeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
