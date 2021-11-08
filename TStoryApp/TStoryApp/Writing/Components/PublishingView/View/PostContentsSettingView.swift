//
//  PostContentsSettingView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/01.
//

import UIKit

class PostContentsSettingView: UIView {
    
    var writeFormModel: [WriteFormModel] = []
    
    lazy var postTitleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 16, weight: .light)
        textField.textColor = .black
        textField.borderStyle = .none
        textField.delegate = self
        addSubview(textField)
        return textField
    }()
    
    lazy var postTagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray.withAlphaComponent(0.8)
//        label.text = "#태그 입력"
        addSubview(label)
        return label
    }()
    
    lazy var postImageView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(imageView)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            postTitleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postTitleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            postTagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postTagLabel.topAnchor.constraint(equalTo: postTitleTextField.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.widthAnchor.constraint(equalToConstant: 100),
            postImageView.heightAnchor.constraint(equalToConstant: 100),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setPostTitle(postTitle: String) {
        postTitleTextField.text = postTitle
    }
    
    func getPostTitle() -> String {
        return postTitleTextField.text!
    }
    
    func setPostTag(postTag: String) {
        postTagLabel.text = postTag
    }

    func getPostTag() -> String {
        return postTagLabel.text!
    }

}
