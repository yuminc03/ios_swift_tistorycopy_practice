//
//  NotificationSettingViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

class NotificationSettingViewController: UIViewController{
    
    var notificationModel = NotificationModel()
    
    lazy var notificationSettingTopView: NotificationSettingTopView = {
        let topView = NotificationSettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissNotificationSettingButton.addTarget(self, action: #selector(dismissNotificationSettingButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var notificationSettingPushAlarmView: NotificationCellView = {
        let pushAlarmView = NotificationCellView(cellName: "푸시 알림", switchControlSize: CGRect(x: 330, y: 15, width: 35, height: 15))
        pushAlarmView.translatesAutoresizingMaskIntoConstraints = false
        pushAlarmView.backgroundColor = .white
        view.addSubview(pushAlarmView)
        return pushAlarmView
    } ()
    
    lazy var pushAlarmViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separator)
        return separator
    } ()
    
    
    lazy var notificationSettingStackView: NotificationSettingStackView = {
        let stackView = NotificationSettingStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.setNotificationModel(model: notificationModel)
        stackView.setStackView()
        view.addSubview(stackView)
        return stackView
    } ()
    
    lazy var lightGrayColorView: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.addSubview(colorView)
        return colorView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(notificationModel: NotificationModel){
        super.init(nibName: nil, bundle: nil)
        self.notificationModel = notificationModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            notificationSettingTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationSettingTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            notificationSettingPushAlarmView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingPushAlarmView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingPushAlarmView.topAnchor.constraint(equalTo: notificationSettingTopView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            pushAlarmViewBottomSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pushAlarmViewBottomSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pushAlarmViewBottomSeparator.topAnchor.constraint(equalTo: notificationSettingPushAlarmView.bottomAnchor),
            pushAlarmViewBottomSeparator.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            notificationSettingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingStackView.topAnchor.constraint(equalTo: notificationSettingTopView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lightGrayColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightGrayColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightGrayColorView.topAnchor.constraint(equalTo: notificationSettingStackView.bottomAnchor),
            lightGrayColorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func dismissNotificationSettingButtonDidTapped(button: UIButton){
        self.notificationModel = notificationSettingStackView.getNotificationModel()
        print(self.notificationModel)
        self.dismiss(animated: false, completion: nil)
    }
}
