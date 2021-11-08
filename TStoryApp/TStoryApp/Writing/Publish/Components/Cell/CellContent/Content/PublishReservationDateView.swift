//
//  PublishReservationDateView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/07.
//

import UIKit

class PublishReservationDateView: UIView {
    
    lazy var reservationDateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("2021.11.7.", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 1
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        addSubview(button)
        return button
    } ()
    
    lazy var reservationTimeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("17:23", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 1
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        addSubview(button)
        return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            reservationDateButton.heightAnchor.constraint(equalToConstant: 30),
            reservationDateButton.trailingAnchor.constraint(equalTo: reservationTimeButton.leadingAnchor, constant: -10),
            reservationDateButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            reservationTimeButton.heightAnchor.constraint(equalToConstant: 30),
            reservationTimeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reservationTimeButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
