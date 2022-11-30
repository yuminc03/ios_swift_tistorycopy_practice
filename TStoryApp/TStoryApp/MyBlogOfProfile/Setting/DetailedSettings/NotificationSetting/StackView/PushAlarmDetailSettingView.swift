//
//  PushAlarmDetailSettingView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/23.
//

import UIKit

class PushAlarmDetailSettingView: UIView {
    
    var notificationModel = NotificationModel()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
        return stackView
    } ()
    
    lazy var commentAlarmSettingView: NotificationCellView = {
        let commentView = NotificationCellView(cellName: "댓글 ・ 답글")
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.backgroundColor = .white
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = notificationModel.commentAlarm
        uiSwitch.setSwitchOnColor(switchIsOn: uiSwitch.switchIsOn)
        uiSwitch.tag = 1
        uiSwitch.delegate = self
        commentView.addSubview(uiSwitch)
        return commentView
    } ()
    lazy var commentAlarmViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()

    
    lazy var teamBlogInviteAlarmSettingView: NotificationCellView = {
        let teamBlogView = NotificationCellView(cellName: "팀블로그 초대 ・ 수락")
        teamBlogView.translatesAutoresizingMaskIntoConstraints = false
        teamBlogView.backgroundColor = .white
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = notificationModel.teamBlogInviteAlarm
        uiSwitch.setSwitchOnColor(switchIsOn: uiSwitch.switchIsOn)
        uiSwitch.tag = 2
        uiSwitch.delegate = self
        teamBlogView.addSubview(uiSwitch)
        return teamBlogView
    } ()
    lazy var teamBlogInviteAlarmBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()
    
    
    lazy var subscribeAlarmSettingView: NotificationCellView = {
        let subscribeView = NotificationCellView(cellName: "구독")
        subscribeView.translatesAutoresizingMaskIntoConstraints = false
        subscribeView.backgroundColor = .white
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = notificationModel.subscibeAlarm
        uiSwitch.setSwitchOnColor(switchIsOn: uiSwitch.switchIsOn)
        uiSwitch.tag = 3
        uiSwitch.delegate = self
        subscribeView.addSubview(uiSwitch)
        return subscribeView
    } ()
    lazy var subscribeAlarmBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()
     
    
    lazy var disturbStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    } ()
    
    lazy var doNotDisturbView: NotificationCellView = {
        let disturbView = NotificationCellView(cellName: "방해금지 모드")
        disturbView.translatesAutoresizingMaskIntoConstraints = false
        disturbView.backgroundColor = .white
        let uiSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
        uiSwitch.switchIsOn = notificationModel.doNotdisturbMode
        uiSwitch.setSwitchOnColor(switchIsOn: uiSwitch.switchIsOn)
        uiSwitch.delegate = self
        disturbView.addSubview(uiSwitch)
        return disturbView
    } ()
    lazy var doNotDisturbViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return separator
    } ()
    
    lazy var doNotDisturbSetTimeView: TimeSelectView = {
        let setTimeView = TimeSelectView(time: "오전 00:00 ~ 오전 07:00")
        setTimeView.translatesAutoresizingMaskIntoConstraints = false
        setTimeView.backgroundColor = .white
        return setTimeView
    } ()
    lazy var doNotDistrubSetTimeViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return separator
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(pushOn: Bool, notDisturbOn: Bool){
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for subview in disturbStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        if pushOn {
            stackView.addArrangedSubview(commentAlarmSettingView)
            commentAlarmSettingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(commentAlarmViewBottomSeparator)
            commentAlarmViewBottomSeparator.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
            
            stackView.addArrangedSubview(teamBlogInviteAlarmSettingView)
            teamBlogInviteAlarmSettingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(teamBlogInviteAlarmBottomSeparator)
            teamBlogInviteAlarmBottomSeparator.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
            
            stackView.addArrangedSubview(subscribeAlarmSettingView)
            subscribeAlarmSettingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(subscribeAlarmBottomSeparator)
            subscribeAlarmBottomSeparator.heightAnchor.constraint(equalToConstant: 10).isActive = true
            
            stackView.addArrangedSubview(doNotDisturbView)
            doNotDisturbView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(doNotDisturbViewBottomSeparator)
            doNotDisturbViewBottomSeparator.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
 
            if notDisturbOn {
                stackView.addArrangedSubview(disturbStackView)
                disturbStackView.addArrangedSubview(doNotDisturbSetTimeView)
                doNotDisturbSetTimeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                disturbStackView.addArrangedSubview(doNotDistrubSetTimeViewBottomSeparator)
                doNotDistrubSetTimeViewBottomSeparator.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
            }
        }
    }
    
    func setNotificationModel(model: NotificationModel) {
        self.notificationModel = model
    }
    
    func getNotificationModel() -> NotificationModel {
        return self.notificationModel
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension PushAlarmDetailSettingView: NotificationSwitchControlDelegate {
    func switchIsOnSetUI(index: Int, switchIsOn: Bool) {
        if index == 1 {
            notificationModel.commentAlarm = switchIsOn
        }
        else if index == 2 {
            notificationModel.teamBlogInviteAlarm = switchIsOn
        }
        else if index == 3 {
            notificationModel.subscibeAlarm = switchIsOn
        }
        else {
            switchIsOn ? setUI(pushOn: notificationModel.pushAlarm, notDisturbOn: true) : setUI(pushOn: notificationModel.pushAlarm, notDisturbOn: false)
            notificationModel.doNotdisturbMode = switchIsOn
        }
    }

}
