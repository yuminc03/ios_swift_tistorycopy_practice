//
//  CategoryStackView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/27.
//

import UIKit

class CategoryStackView: UIStackView {
    
//    var categoryNameArr = MyContentTableViewHeader().categoryNameArr
//    var categoryNumArr = MyContentTableViewHeader().categoryNumArr
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 0
        
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    private func setStackView() {
//        for i in 0 ..< 5 {
//            let noticeKindView = UIView()
//            noticeKindView.translatesAutoresizingMaskIntoConstraints = false
//            noticeKindView.tag = i
//            //noticeKindView.backgroundColor = .white
//            addArrangedSubview(noticeKindView)
//            let gesture = UITapGestureRecognizer(target: self, action: #selector(stackViewDidTapped))
//            noticeKindView.addGestureRecognizer(gesture)
//            noticeKindView.heightAnchor.constraint(equalToConstant: 70).isActive = true
//
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.font = .systemFont(ofSize: 16, weight: .thin)
//            label.textColor = .black
//            label.text = noticeKindArr[i]
//            noticeKindView.addSubview(label)
//
//            label.leadingAnchor.constraint(equalTo: noticeKindView.leadingAnchor, constant: 15).isActive = true
//            label.centerYAnchor.constraint(equalTo: noticeKindView.centerYAnchor).isActive = true
//
//            if i == noticeKindArr.count - 1 { continue }
//            let dividedLine = UIView()
//            dividedLine.translatesAutoresizingMaskIntoConstraints = false
//            addArrangedSubview(dividedLine)
//            dividedLine.backgroundColor = .lightGray.withAlphaComponent(0.3)
//            dividedLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        }
//    }
    
}
