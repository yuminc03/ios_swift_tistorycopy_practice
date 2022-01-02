//
//  PostContentsTagSettingView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/03.
//

import UIKit

class PostContentsTagSettingView: UIView {
    
    var writeFormModel : [WriteFormModel] = []
    var tagInputTextPlaceHolder: String = ""
    
    lazy var tagSettingHeaderView: PostContentsTagSettingHeaderView = {
        let tagSettingHeaderView = PostContentsTagSettingHeaderView()
        tagSettingHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tagSettingHeaderView.backgroundColor = .white
        self.addSubview(tagSettingHeaderView)
        return tagSettingHeaderView
    }()
    
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
    
    lazy var recentlyUsedTagCommentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "최근 사용한 태그"
        addSubview(label)
        return label
    }()
    
    lazy var recentlyUsedTagCommentsLabel: UILabel = {
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
            tagSettingHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagSettingHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagSettingHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tagSettingHeaderView.heightAnchor.constraint(equalToConstant: 60)
        ])
        let headerLine = devidedLineViewFunc()
        tagSettingHeaderView.addSubview(headerLine)
        NSLayoutConstraint.activate([
            headerLine.heightAnchor.constraint(equalToConstant: 0.5),
            headerLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLine.topAnchor.constraint(equalTo: tagSettingHeaderView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tagInputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagInputTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagInputTextField.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 25)
        ])
        let middleLine = devidedLineViewFunc()
        addSubview(middleLine)
        NSLayoutConstraint.activate([
            middleLine.heightAnchor.constraint(equalToConstant: 0.5),
            middleLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleLine.topAnchor.constraint(equalTo: tagInputTextField.bottomAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            recentlyUsedTagCommentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlyUsedTagCommentLabel.topAnchor.constraint(equalTo: middleLine.bottomAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            recentlyUsedTagCommentsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recentlyUsedTagCommentsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            recentlyUsedTagCommentsLabel.topAnchor.constraint(equalTo: recentlyUsedTagCommentLabel.bottomAnchor, constant: 25)
        ])
    }
    
    func setWriteFormModel(writeFormModel: [WriteFormModel]){
        self.writeFormModel = writeFormModel
    }
    
    func setTagInputTextPlaceHolder(writeFormModel: [WriteFormModel]){
        self.tagInputTextPlaceHolder = self.writeFormModel[0].publishSettingForm[0].publishTagText
        tagInputTextField.text = self.tagInputTextPlaceHolder
    }

    func getTagInputTextFieldText() -> String? {
        return tagInputTextField.text
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
}
