//
//  PublishSettingHeaderView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/05.
//

import UIKit

class PublishSettingHeaderView: UIView {

    var titleText: String = ""
    var publishTag: String = ""
    var categoryName: String = ""
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.text = "제목"
        textField.font = .systemFont(ofSize: 16, weight: .light)
        textField.textColor = .black
        textField.borderStyle = .none
        textField.delegate = self
        addSubview(textField)
        return textField
    } ()
    
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "#태그 입력"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        addSubview(label)
        return label
    } ()
    
    lazy var representImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(imageView)
        return imageView
    } ()
    
    private lazy var seperator: UIView = {
        let seperatorView = UIView()
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperatorView)
        return seperatorView
    } ()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "카테고리"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var categorySelectionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("선택 안 함  〉", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
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
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: representImageView.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagLabel.trailingAnchor.constraint(equalTo: representImageView.leadingAnchor, constant: -10),
            tagLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            representImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            representImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            representImageView.heightAnchor.constraint(equalToConstant: 100),
            representImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.topAnchor.constraint(equalTo: representImageView.bottomAnchor, constant: 20),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            categoryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryTitleLabel.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 10),
            categoryTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            categorySelectionButton.leadingAnchor.constraint(greaterThanOrEqualTo: categoryTitleLabel.trailingAnchor, constant: -10),
            categorySelectionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            categorySelectionButton.centerYAnchor.constraint(equalTo: categoryTitleLabel.centerYAnchor)
        ])
    }
    
    func setTitleTextFieldText(title: String){
        titleTextField.text = title
    }
    
    func getTitleTextFieldText() -> String {
        return titleTextField.text!
    }
    
    func setPublishTagText(tag: String) {
        tagLabel.text = tag
        
    }
    
    func getPublishTagText() -> String {
        return tagLabel.text!
    }
    
    func setCategorySelectionButtonText(name: String) {
        let buttonText = name
        categorySelectionButton.setTitle(buttonText + "  〉", for: .normal)
        self.categoryName = buttonText
    }
    
    func getCategorySelectionButtonText() -> String {
        return self.categoryName
    }
    
}
