//
//  NotificationSettingTableViewCell.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

class NotificationSettingTableViewCell: UITableViewCell{
     
    lazy var notificationName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .light)
        addSubview(label)
        return label
    } ()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            notificationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            notificationName.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            notificationName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func setNotificationSettingTableViewCell(name: String){
        self.notificationName.text = name
    }
}
