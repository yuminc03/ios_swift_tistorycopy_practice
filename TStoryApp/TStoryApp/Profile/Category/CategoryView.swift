//
//  CategoryView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/27.
//

import UIKit


protocol CategoryViewDelegate: AnyObject {
    func categoryDidTapped(at index: Int)
}

class CategoryView: UIView {
    
    let categoryStackView = UIStackView()
    var categories : [ProfileCategory] = []
    
    weak var delegate: CategoryViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.text = "카테고리"
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 15
        
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryStackView.spacing = 20
        categoryStackView.axis = .vertical
        addSubview(categoryStackView)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            categoryStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300)
        ])
    }
    
    func setStackView() {
        for i in 0 ..< categories.count {
            let textColor = categories[i].isSelected ? UIColor.red : UIColor.black
            
            let categoryKindView = UIView()
            categoryKindView.translatesAutoresizingMaskIntoConstraints = false
            categoryKindView.tag = i
            
            categoryKindView.backgroundColor = .clear
            categoryStackView.addArrangedSubview(categoryKindView)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryStackViewDidTapped))
            categoryKindView.addGestureRecognizer(gesture)
//            categoryKindView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            let categoryNameLabel = UILabel()
            categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryNameLabel.font = .systemFont(ofSize: 16, weight: .thin)
            categoryNameLabel.textColor = textColor
            categoryNameLabel.text = categories[i].categoryName
            categoryKindView.addSubview(categoryNameLabel)
            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryKindView.leadingAnchor, constant: 20).isActive = true
            categoryNameLabel.topAnchor.constraint(equalTo: categoryKindView.topAnchor).isActive = true
            categoryNameLabel.bottomAnchor.constraint(equalTo: categoryKindView.bottomAnchor).isActive = true
            
            let categoryNumLabel = UILabel()
            categoryNumLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryNumLabel.font = .systemFont(ofSize: 16, weight: .light)
            categoryNumLabel.textColor = textColor
            categoryNumLabel.text = String(categories[i].categoryNum)
            categoryKindView.addSubview(categoryNumLabel)
            categoryNumLabel.trailingAnchor.constraint(equalTo: categoryKindView.trailingAnchor, constant: -20).isActive = true
            categoryNumLabel.centerYAnchor.constraint(equalTo: categoryKindView.centerYAnchor).isActive = true
            
            if i == categories.count - 1 { continue }
            let devidedLine = UIView()
            devidedLine.translatesAutoresizingMaskIntoConstraints = false
            devidedLine.backgroundColor = .lightGray.withAlphaComponent(0.3)
            categoryStackView.addArrangedSubview(devidedLine)
            devidedLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
        }
    }
    
    func getCategory(categories: [ProfileCategory]) {
        self.categories = categories
    }
    
    @objc private func categoryStackViewDidTapped(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        delegate?.categoryDidTapped(at: tag)
    }
    
}
