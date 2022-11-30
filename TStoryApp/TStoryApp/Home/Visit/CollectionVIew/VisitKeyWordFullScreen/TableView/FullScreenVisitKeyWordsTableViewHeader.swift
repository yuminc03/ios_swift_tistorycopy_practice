//
//  FullScreenVisitKeyWordTableViewHeader.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/16.
//

import UIKit

class FullScreenVisitKeyWordsTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var dismissViewControllerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✕", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "유입 키워드"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    lazy var headerSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최근 7일"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dismissViewControllerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissViewControllerButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dismissViewControllerButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitle.topAnchor.constraint(equalTo: dismissViewControllerButton.bottomAnchor, constant: 30),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            headerSubTitle.leadingAnchor.constraint(equalTo: headerTitle.trailingAnchor, constant: 5),
            headerSubTitle.topAnchor.constraint(equalTo: dismissViewControllerButton.bottomAnchor, constant: 32)
        ])
        
    }
}
