//
//  NotificationSettingStackView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class NotificationSettingStackView: UIStackView {
    
    var notificationModel = NotificationModel()
    let notificationKindArr: [String] = ["푸시 알림", "댓글 ・ 답글", "팀블로그 초대 ・ 수락", "구독", "방해금지 모드"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStackView(){
        var settingSwitch = NotificationSwitchControl()
        for i in 0 ..< notificationKindArr.count{
            var cellView = UIView()
            cellView.tag = i
            if i <= 3 {
                cellView = NotificationCellView(cellName: notificationKindArr[i], switchControlSize: CGRect(x: 200, y: 15, width: 20, height: 10))
                cellView.translatesAutoresizingMaskIntoConstraints = false
                cellView.backgroundColor = .white
                self.addArrangedSubview(cellView)
                cellView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            }
            else {
                cellView = DoNotDisturbView(cellName: notificationKindArr[i], isSelected: notificationModel.doNotdisturbMode, switchControlSize: CGRect(x: 200, y: 15, width: 20, height: 10))
                
                cellView.translatesAutoresizingMaskIntoConstraints = false
                cellView.backgroundColor = .white
                self.addArrangedSubview(cellView)
                cellView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
            }
            settingSwitch = NotificationSwitchControl(frame: CGRect(x: 330, y: 15, width: 35, height: 15))
            cellView.addSubview(settingSwitch)
            
            switch i {
            case 0: settingSwitch.switchIsOn = notificationModel.pushAlarm;
            case 1: settingSwitch.switchIsOn = notificationModel.commentAlarm;
            case 2: settingSwitch.switchIsOn = notificationModel.teamBlogInviteAlarm;
            case 3: settingSwitch.switchIsOn = notificationModel.subscibeAlarm;
            case 4: settingSwitch.switchIsOn = notificationModel.doNotdisturbMode
                settingSwitch.setSwitchOnColor(switchIsOn: settingSwitch.switchIsOn);
            default:
                return
            }
            
            let separator = UIView()
            separator.translatesAutoresizingMaskIntoConstraints = false
            separator.backgroundColor = .lightGray.withAlphaComponent(0.6)
            self.addArrangedSubview(separator)
            separator.heightAnchor.constraint(equalToConstant: 0.1).isActive = true
            
            if i == 0 || i == 3 {
                let boldSeparator = UIView()
                boldSeparator.translatesAutoresizingMaskIntoConstraints = false
                boldSeparator.backgroundColor = .lightGray.withAlphaComponent(0.3)
                self.addArrangedSubview(boldSeparator)
                boldSeparator.heightAnchor.constraint(equalToConstant: 10).isActive = true
            }
        }
        
    }
    
    func setNotificationModel(model: NotificationModel){
        self.notificationModel = model
    }
    
    func getNotificationModel() -> NotificationModel {
        return self.notificationModel
    }
}
