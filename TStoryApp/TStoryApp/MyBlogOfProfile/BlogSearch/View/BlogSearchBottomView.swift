//
//  BlogSearchBottomView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/23.
//

import UIKit

class BlogSearchBottomView: UIView {
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        addSubview(separator)
        return separator
    } ()
    
    lazy var recentlySearchWordsSaveNotButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("최근 검색어 저장 끄기", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        addSubview(button)
        return button
    } ()
    
    lazy var smallDividedView: UIView = {
        let smallView = UIView()
        smallView.translatesAutoresizingMaskIntoConstraints = false
        smallView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        addSubview(smallView)
        return smallView
    } ()
    
    lazy var recentlySearchWordsAllDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("전체삭제", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
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
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.topAnchor.constraint(equalTo: topAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            recentlySearchWordsSaveNotButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlySearchWordsSaveNotButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            recentlySearchWordsSaveNotButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            smallDividedView.widthAnchor.constraint(equalToConstant: 1),
            smallDividedView.heightAnchor.constraint(equalToConstant: 10),
            smallDividedView.leadingAnchor.constraint(equalTo: recentlySearchWordsSaveNotButton.trailingAnchor, constant: 10),
            smallDividedView.centerYAnchor.constraint(equalTo: recentlySearchWordsSaveNotButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recentlySearchWordsAllDeleteButton.leadingAnchor.constraint(equalTo: smallDividedView.trailingAnchor, constant: 10),
            recentlySearchWordsAllDeleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            recentlySearchWordsAllDeleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
