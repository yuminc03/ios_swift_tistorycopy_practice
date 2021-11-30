//
//  ComponentsView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/30.
//

import UIKit

class ComponentsView: UIView {
    
    private lazy var componentIconView: UIView = {
        let component = UIView()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.backgroundColor = .lightGray.withAlphaComponent(0.5)
        component.layer.cornerRadius = 6
        addSubview(component)
        return component
    } ()
    
    private lazy var componentNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
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
            componentIconView.widthAnchor.constraint(equalToConstant: 12),
            componentIconView.heightAnchor.constraint(equalToConstant: 12),
            componentIconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentIconView.topAnchor.constraint(equalTo: topAnchor),
            componentIconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            componentNumberLabel.leadingAnchor.constraint(equalTo: componentIconView.trailingAnchor, constant: 5),
            componentNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentNumberLabel.centerYAnchor.constraint(equalTo: componentIconView.centerYAnchor)
        ])
    }
    
    func setComponentNumber(number: Int) {
        componentNumberLabel.text = String(number)
    }
}
