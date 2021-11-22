//
//  File.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class NotificationCellView: UIView {
    
    private var cellName: String = ""
    
    lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = cellName
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    init(cellName: String, switchControlSize: CGRect){
        super.init(frame: .zero)
        self.cellName = cellName
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            cellNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            cellNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}
