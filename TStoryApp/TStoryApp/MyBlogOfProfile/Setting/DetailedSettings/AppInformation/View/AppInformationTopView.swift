//
//  AppInformationTopView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/22.
//

import UIKit

class AppInformationTopView: UIView {
    
    lazy var dismissAppInformationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앱 정보"
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
            dismissAppInformationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissAppInformationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dismissAppInformationButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitle.topAnchor.constraint(equalTo: dismissAppInformationButton.bottomAnchor, constant: 25)
        ])
    }
}
