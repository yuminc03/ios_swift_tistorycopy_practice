//
//  PublishCurrentDateView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/07.
//

import UIKit

class PublishCurrentDateView: UIView {
    
    var publishDateIndex: Int = 0
    
    lazy var publishTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "발행일"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var publishCurrentDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "현재"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.tag = 0
        addSubview(label)
        return label
    } ()
    
    lazy var publishReservationDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "예약"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.tag = 1
        addSubview(label)
        return label
    } ()
    
    lazy var dividedView: UIView = {
        let dividedView = UIView()
        dividedView.translatesAutoresizingMaskIntoConstraints = false
        dividedView.backgroundColor = .lightGray
        addSubview(dividedView)
        return dividedView
    } ()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(isSelected: Bool) {
        print("set ui")
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            publishTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            publishTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            publishCurrentDateLabel.trailingAnchor.constraint(equalTo: dividedView.leadingAnchor, constant: -15),
            publishCurrentDateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    
        NSLayoutConstraint.activate([
            dividedView.widthAnchor.constraint(equalToConstant: 1),
            dividedView.heightAnchor.constraint(equalToConstant: 12),
            dividedView.trailingAnchor.constraint(equalTo: publishReservationDateLabel.leadingAnchor, constant: -15),
            dividedView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            publishReservationDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            publishReservationDateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setPublishDateIndex(index: Int) {
        self.publishDateIndex = index
    }
    
    func getPublishDateIndex() -> Int {
        return publishDateIndex
    }
    
}
