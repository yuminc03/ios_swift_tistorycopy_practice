//
//  NotificationSettingPushAlarmView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/23.
//

import UIKit

class NotificationSettingPushAlarmView: UIView {
    
    var isSelected: Bool = true
    
    lazy var notificationNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "푸시 알림"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var notificationUISwitch: NotificationSwitchControl = {
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = true
        addSubview(uiSwitch)
        return uiSwitch
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
            notificationNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            notificationNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            notificationNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])

    }
}
