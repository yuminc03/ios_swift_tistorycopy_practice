//
//  VisitNumGraphFullScreenTopView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/25.
//

import UIKit

class VisitNumGraphFullScreenTopView: UIView {

    lazy var dismissVisitNumGraphFullScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✕", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "통계"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
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
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dismissVisitNumGraphFullScreenButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissVisitNumGraphFullScreenButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dismissVisitNumGraphFullScreenButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            viewTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
