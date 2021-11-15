//
//  PopulartiyPostSeeAllTableHeaderView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/14.
//

import UIKit

class PopularityPostSeeAllTableHeaderView: UITableViewHeaderFooterView{
    
    lazy var backToControllerButton: UIButton = {
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
        label.text = "인기글"
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
            backToControllerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backToControllerButton.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitle.topAnchor.constraint(equalTo: backToControllerButton.bottomAnchor, constant: 30),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            headerSubTitle.leadingAnchor.constraint(equalTo: headerTitle.trailingAnchor, constant: 5),
            headerSubTitle.topAnchor.constraint(equalTo: backToControllerButton.bottomAnchor, constant: 40)
        ])
    }
}
