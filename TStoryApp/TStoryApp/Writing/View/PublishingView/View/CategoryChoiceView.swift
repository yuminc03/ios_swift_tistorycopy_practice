//
//  CategoryChoiceView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/01.
//

import UIKit

class CategoryChoiceView: UIView{
    
    var writeFormModel : [WriteFormModel] = []
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "카테고리"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    }()
    
    lazy var categoryChoiceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
//        let buttonText: String = "\(writeFormModel[0].publishSettingForm[0].publishCategoryName)" + " >"
//        button.setTitle("buttonText", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        addSubview(button)
        return button
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
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryChoiceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            categoryChoiceButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryChoiceButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setCategoryNameButtonText(text: String) {
        let buttonText = text
        categoryChoiceButton.setTitle(buttonText + "  >", for: .normal)
        writeFormModel[0].publishSettingForm[0].publishCategoryName = buttonText
    }
    
    func getCategoryNameButtonText() -> String {
        return writeFormModel[0].publishSettingForm[0].publishCategoryName
    }
}
