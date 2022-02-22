//
//  BlogSearchView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/22.
//

import UIKit

class BlogSearchTopView: UIView {
    
    lazy var dismissBlogSearchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var textFieldUnderView: UIView = {
        let underView = UIView()
        underView.translatesAutoresizingMaskIntoConstraints = false
        underView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        underView.layer.cornerRadius = 20
        addSubview(underView)
        return underView
    } ()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "티스토리 전체에서 검색"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textFieldUnderView.addSubview(textField)
        return textField
    } ()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⎋", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .light)
        textFieldUnderView.addSubview(button)
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
            dismissBlogSearchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissBlogSearchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dismissBlogSearchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            textFieldUnderView.leadingAnchor.constraint(equalTo: dismissBlogSearchButton.trailingAnchor, constant: 20),
            textFieldUnderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textFieldUnderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            textFieldUnderView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.trailingAnchor.constraint(equalTo: textFieldUnderView.trailingAnchor, constant: -10),
            searchButton.centerYAnchor.constraint(equalTo: textFieldUnderView.centerYAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: textFieldUnderView.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: textFieldUnderView.trailingAnchor, constant: -50),
            searchTextField.topAnchor.constraint(equalTo: textFieldUnderView.topAnchor, constant: 5),
            searchTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
