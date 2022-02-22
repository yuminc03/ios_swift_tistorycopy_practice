//
//  CategorySelectionView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/07.
//

import UIKit

protocol CategorySelectionViewDelegate: AnyObject {
    func categorySelectionDidTapped(name categoryName: String)
}
class CategorySelectionView: UIView {
    
    var publishCategoryName: String = ""
    weak var delegate: CategorySelectionViewDelegate?
    
    lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "카테고리 선택"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        addSubview(stackView)
        return stackView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCategoryStackView() {
        let categories = ["선택 안 함", "책", "레진아트", "그림", "일상"]
        for i in 0 ..< categories.count {
            let categoryNameColor = categories[i] == publishCategoryName ? UIColor.red : UIColor.black
            
            let categoryView = UIView()
            categoryView.translatesAutoresizingMaskIntoConstraints = false
            categoryView.tag = i
            categoryView.backgroundColor = .white
            categoryStackView.addArrangedSubview(categoryView)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryViewDidTapped))
            categoryView.addGestureRecognizer(gesture)
            categoryView.isUserInteractionEnabled = true
            
            let categoryNameLabel = UILabel()
            categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryNameLabel.font = .systemFont(ofSize: 16, weight: .light)
            categoryNameLabel.textColor = categoryNameColor
            categoryNameLabel.text = categories[i]
            categoryView.addSubview(categoryNameLabel)
            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 20).isActive = true
            categoryNameLabel.topAnchor.constraint(equalTo: categoryView.topAnchor).isActive = true
            categoryNameLabel.bottomAnchor.constraint(equalTo: categoryView.bottomAnchor).isActive = true
            
            let seperator = UIView()
            seperator.translatesAutoresizingMaskIntoConstraints = false
            seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
            categoryStackView.addArrangedSubview(seperator)
            seperator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            categoryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryStackView.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: 30),
            categoryStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -250)
        ])
    }
    
    func setCategoryName(name: String) {
        self.publishCategoryName = name
    }
    
    @objc private func categoryViewDidTapped(gesture: UITapGestureRecognizer) {
        print("tapped")
        guard let categoryName = gesture.view?.subviews[0] as? UILabel else { return }
        let name = categoryName.text!
        delegate?.categorySelectionDidTapped(name: name)
    }
}
