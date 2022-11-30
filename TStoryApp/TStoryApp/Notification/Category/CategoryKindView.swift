//
//  CategoryKindView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/28.
//

import UIKit

protocol CategoryKindViewDelegate: AnyObject {
    func categoryDidTapped(at index: Int)
}

class CategoryKindView: UIView {
    
    let categoryStackView = UIStackView()
    var categories: [NoticeCategory] = []
    weak var delegate: CategoryKindViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryStackView.spacing = 0
        categoryStackView.axis = .vertical
        addSubview(categoryStackView)
        NSLayoutConstraint.activate([
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryStackView.topAnchor.constraint(equalTo: topAnchor),
            categoryStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func setStackView() {
        for i in 0 ..< categories.count {
            let textStyle = categories[i].isSelected ? UIFont.Weight.bold : UIFont.Weight.light
            
            let noticeKindView = UIView()
            noticeKindView.tag = i
            noticeKindView.translatesAutoresizingMaskIntoConstraints = false
            noticeKindView.backgroundColor = .clear
            categoryStackView.addArrangedSubview(noticeKindView)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(stackViewDidTapped))
            noticeKindView.addGestureRecognizer(gesture)
            let categoryName = UILabel()
            categoryName.translatesAutoresizingMaskIntoConstraints = false
            categoryName.font = .systemFont(ofSize: 16, weight: textStyle)
            categoryName.textColor = .black
            categoryName.text = categories[i].categoryName
            noticeKindView.addSubview(categoryName)
            categoryName.leadingAnchor.constraint(equalTo: noticeKindView.leadingAnchor, constant: 20).isActive = true
            categoryName.topAnchor.constraint(equalTo: noticeKindView.topAnchor, constant: 25).isActive = true
            categoryName.bottomAnchor.constraint(equalTo: noticeKindView.bottomAnchor, constant: -25).isActive = true
            
            if i == categories.count - 1 { continue }
            let dividedLine = UIView()
            dividedLine.translatesAutoresizingMaskIntoConstraints = false
            dividedLine.backgroundColor = .lightGray.withAlphaComponent(0.3)
            categoryStackView.addArrangedSubview(dividedLine)
            dividedLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    }
    
    func setCategory(categories: [NoticeCategory]) {
        self.categories = categories
    }
    
    @objc func stackViewDidTapped(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        delegate?.categoryDidTapped(at: tag)
    }
}
