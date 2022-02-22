//
//  BlogSearchWordsView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/23.
//

import UIKit

class BlogSearchWordsView: UIView {
    
    var searchWords: String = ""
    var searchDate: String = ""
    
    lazy var searchWordsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = searchWords
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var searchDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = searchDate
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var searchDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✕", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(button)
        return button
    } ()
    
    init(searchWords: String, searchDate: String) {
        self.searchWords = searchWords
        self.searchDate = searchDate
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            searchWordsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchWordsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            searchWordsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            searchDateLabel.trailingAnchor.constraint(equalTo: searchDeleteButton.leadingAnchor, constant: -20),
            searchDateLabel.centerYAnchor.constraint(equalTo: searchWordsLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchDeleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchDeleteButton.centerYAnchor.constraint(equalTo: searchWordsLabel.centerYAnchor)
        ])
    }
}
