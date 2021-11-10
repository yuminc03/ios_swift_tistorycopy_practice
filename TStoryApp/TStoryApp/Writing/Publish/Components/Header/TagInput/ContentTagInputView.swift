//
//  ContentTagInputView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/08.
//

import UIKit

class ContentTagInputView: UIView {
    
    var tagInputTextPlaceHolder: String = ""
    
    lazy var tagInputHeaderView: TagInputHeaderView = {
        let headerView = TagInputHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        addSubview(headerView)
        return headerView
    } ()
    
    lazy var tagInputTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.font = .systemFont(ofSize: 16, weight: .light)
        textfield.textColor = .lightGray.withAlphaComponent(0.8)
        textfield.delegate = self
        self.addSubview(textfield)
        return textfield
    }()
    
    lazy var seperator: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        return seperator
    } ()
    
    lazy var recentlyUsedTagCommentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "최근 사용한 태그"
        addSubview(label)
        return label
    }()
    
    lazy var recentlyUsedTagLabel: UILabel = {
        let usedTagCommentsLabel = UILabel()
        usedTagCommentsLabel.translatesAutoresizingMaskIntoConstraints = false
        usedTagCommentsLabel.font = .systemFont(ofSize: 16, weight: .light)
        usedTagCommentsLabel.textColor = .lightGray.withAlphaComponent(0.8)
        usedTagCommentsLabel.text = "#해리포터 후플푸프  #태블릿 그림\n#천천히 해도 괜찮아  #happy halloween\n#엘리아  #그림 그리기  #할로윈 코스튬  #할로윈"
        usedTagCommentsLabel.lineBreakMode = .byWordWrapping
        usedTagCommentsLabel.numberOfLines = 3
        
        let attrString = NSMutableAttributedString(string: usedTagCommentsLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        usedTagCommentsLabel.attributedText = attrString
        
        addSubview(usedTagCommentsLabel)
        return usedTagCommentsLabel
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
            tagInputHeaderView.heightAnchor.constraint(equalToConstant: 60),
            tagInputHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagInputHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagInputHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tagInputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagInputTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagInputTextField.topAnchor.constraint(equalTo: tagInputHeaderView.bottomAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 0.5),
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.topAnchor.constraint(equalTo: tagInputTextField.bottomAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            recentlyUsedTagCommentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlyUsedTagCommentLabel.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            recentlyUsedTagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlyUsedTagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            recentlyUsedTagLabel.topAnchor.constraint(equalTo: recentlyUsedTagCommentLabel.bottomAnchor, constant: 25)
        ])
    }

    func getTagInputTextField() -> String? {
        return tagInputTextField.text
    }
    
    func setTagInputTextPlaceHolder(text: String) {
        self.tagInputTextPlaceHolder = text
        tagInputTextField.text = self.tagInputTextPlaceHolder
    }
    
}
