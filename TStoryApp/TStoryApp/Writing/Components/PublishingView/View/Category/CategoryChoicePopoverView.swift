//
//  CategoryChoicePopoverVIew.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/02.
//

import UIKit

protocol CategoryChoicePopoverViewDelegate: AnyObject {
    func categoryDidTapped(name labelText: String)
}
class CategoryChoicePopoverView: UIView {
    
    let categoryChoiceStackView = UIStackView()
    var writeFormModel: [WriteFormModel] = []
    var publishCategoryName: String = ""
    
    weak var delegate: CategoryChoicePopoverViewDelegate?
    
    lazy var categoryViewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.text = "카테고리 선택"
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConstraints() {
        
        categoryChoiceStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryChoiceStackView.spacing = 20
        categoryChoiceStackView.axis = .vertical
        addSubview(categoryChoiceStackView)
        
        NSLayoutConstraint.activate([
            categoryViewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryViewTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            categoryChoiceStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryChoiceStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryChoiceStackView.topAnchor.constraint(equalTo: categoryViewTitle.bottomAnchor, constant: 30),
            categoryChoiceStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -250)
        ])
    }
    
    func setCategoryChoiceStackView() {
        let categories: [String] = ["선택 안 함", "책", "레진아트", "그림", "일상"]
        for i in 0 ..< categories.count {
            let categoryNameColor = categories[i] == publishCategoryName ? UIColor.red : UIColor.black
            
            let categoryView = UIView()
            categoryView.tag = i
            categoryView.translatesAutoresizingMaskIntoConstraints = false
            categoryView.backgroundColor = .white
            categoryChoiceStackView.addArrangedSubview(categoryView)
            let categoryViewGesture = UITapGestureRecognizer(target: self, action: #selector(categoryViewDidTapped))
            categoryView.addGestureRecognizer(categoryViewGesture)
            categoryView.isUserInteractionEnabled = true
            
            let categoryLabel = UILabel()
            categoryLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryLabel.font = .systemFont(ofSize: 16, weight: .thin)
            categoryLabel.textColor = categoryNameColor
            categoryLabel.text = categories[i]
            categoryView.addSubview(categoryLabel)
            categoryLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 20).isActive = true
            categoryLabel.topAnchor.constraint(equalTo: categoryView.topAnchor).isActive = true
            categoryLabel.bottomAnchor.constraint(equalTo: categoryView.bottomAnchor).isActive = true
            
            let dividedLine = UIView()
            dividedLine.translatesAutoresizingMaskIntoConstraints = false
            dividedLine.backgroundColor = .lightGray.withAlphaComponent(0.3)
            categoryChoiceStackView.addArrangedSubview(dividedLine)
            dividedLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            
        }
    }

    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setPublishCategoryName(publishCategoryName: String) {
        self.publishCategoryName = publishCategoryName
        
    }
    
    @objc private func categoryViewDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        guard let labelText = gesture.view?.subviews[0] as? UILabel else { return }
//        print(gesture.view?.tag)
        let texts: String = labelText.text!
//        print(texts)
        delegate?.categoryDidTapped(name: texts)
    }
}

