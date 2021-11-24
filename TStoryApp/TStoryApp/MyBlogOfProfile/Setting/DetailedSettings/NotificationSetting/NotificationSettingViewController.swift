//
//  NotificationSettingViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

protocol NotificationSettingViewControllerDelegate: AnyObject{
    func getNotificationSetting(model: NotificationModel)
}
class NotificationSettingViewController: UIViewController{
    
    var notificationModel = NotificationModel()
    weak var delegate: NotificationSettingViewControllerDelegate?
    
    lazy var notificationSettingTopView: NotificationSettingTopView = {
        let topView = NotificationSettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissNotificationSettingButton.addTarget(self, action: #selector(dismissNotificationSettingButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var notificationSettingPushAlarmView: NotificationCellView = {
        let pushAlarmView = NotificationCellView(cellName: "푸시 알림")
        pushAlarmView.translatesAutoresizingMaskIntoConstraints = false
        pushAlarmView.backgroundColor = .white
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = notificationModel.pushAlarm
        uiSwitch.delegate = self
        pushAlarmView.addSubview(uiSwitch)
        view.addSubview(pushAlarmView)
        return pushAlarmView
    } ()
    
    lazy var pushAlarmViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.addSubview(separator)
        return separator
    } ()
    
    lazy var pushAlarmDetailSettingView: PushAlarmDetailSettingView = {
        let pushAlarmDetailView = PushAlarmDetailSettingView()
        pushAlarmDetailView.translatesAutoresizingMaskIntoConstraints = false
        pushAlarmDetailView.backgroundColor = .white
        view.addSubview(pushAlarmDetailView)
        return pushAlarmDetailView
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
        pushAlarmDetailSettingView.setUI(pushOn: notificationModel.pushAlarm, notDisturbOn: notificationModel.doNotdisturbMode)
        pushAlarmDetailSettingView.setNotificationModel(model: self.notificationModel)
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
            pushAlarmDetailSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pushAlarmDetailSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pushAlarmDetailSettingView.topAnchor.constraint(equalTo: pushAlarmViewBottomSeparator.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            lightGrayColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightGrayColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightGrayColorView.topAnchor.constraint(equalTo: pushAlarmDetailSettingView.bottomAnchor),
            lightGrayColorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func dismissNotificationSettingButtonDidTapped(button: UIButton){
        self.notificationModel = pushAlarmDetailSettingView.getNotificationModel()
        delegate?.getNotificationSetting(model: self.notificationModel)
        self.dismiss(animated: false, completion: nil)
    }
}

extension NotificationSettingViewController: NotificationSwitchControlDelegate {
    func switchIsOnSetUI(index: Int, switchIsOn: Bool) {
        switchIsOn ? pushAlarmDetailSettingView.setUI(pushOn: true, notDisturbOn: false) : pushAlarmDetailSettingView.setUI(pushOn: false, notDisturbOn: false)
        notificationModel.pushAlarm = switchIsOn
    }
   
}
