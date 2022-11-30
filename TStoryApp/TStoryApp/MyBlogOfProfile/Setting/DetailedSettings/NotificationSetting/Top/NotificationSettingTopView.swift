//
//  NotificationSettingTopView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

import UIKit

class NotificationSettingTopView: UIView {
    
    lazy var dismissNotificationSettingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "알림 설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConsraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConsraints(){
        NSLayoutConstraint.activate([
            dismissNotificationSettingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissNotificationSettingButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dismissNotificationSettingButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitleLabel.topAnchor.constraint(equalTo: dismissNotificationSettingButton.bottomAnchor, constant: 25)
        ])
    }
}
