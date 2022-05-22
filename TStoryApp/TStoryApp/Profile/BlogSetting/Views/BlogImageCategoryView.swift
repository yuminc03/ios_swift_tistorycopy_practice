//
//  BlogImageCategoryView.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/22.
//

import UIKit

class BlogImageCategoryView: UIView {
    
    let textLabel = UILabel()
    let separator = UIView()
    var contentText: String = ""
    
    init(text: String) {
        
        super.init(frame: .zero)
        contentText = text
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.text = contentText
        textLabel.font = .systemFont(ofSize: 16, weight: .light)
        self.addSubview(textLabel)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        self.addSubview(separator)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
