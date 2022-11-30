//
//  TopView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

import UIKit


class OtherContentsTopView: UIView{
    
    private var viewTitle: String = ""
    
    lazy var dismissOtherContentsViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewTitle
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    init(title: String) {
        super.init(frame: .zero)
        self.viewTitle = title
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dismissOtherContentsViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissOtherContentsViewButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dismissOtherContentsViewButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            viewTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitleLabel.topAnchor.constraint(equalTo: dismissOtherContentsViewButton.bottomAnchor, constant: 25)
        ])
    }
}
