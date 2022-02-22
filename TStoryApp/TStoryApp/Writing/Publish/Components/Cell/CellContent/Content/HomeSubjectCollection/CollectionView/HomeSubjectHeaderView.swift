//
//  HomeSubjectHeaderView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/10.
//

import UIKit

class HomeSubjectHeaderView: UICollectionReusableView {
    
    lazy var homeSubjectTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
//        label.text = "라이프"
        addSubview(label)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            homeSubjectTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeSubjectTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            homeSubjectTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
