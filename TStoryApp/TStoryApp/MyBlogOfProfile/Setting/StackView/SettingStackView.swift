//
//  SettingStackView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class SettingStackView: UIStackView {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    private var profileName: String = ""
    private var repBlogName: String = ""
    private var pushAlarmOn: String = ""
    private var appIsNewVersion: String = ""

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStackView() {
        let settingStackCellNameArr: [String] = ["계정 설정", "대표 블로그 설정", "알림 설정", "공지사항", "앱 정보", "이용약관", "개인정보처리방침", "오픈소스 라이선스", "도움말", "문의하기"]
        for i in 0 ..< settingStackCellNameArr.count {
            let settingCellView = SettingStackCellView(name: settingStackCellNameArr[i])
            settingCellView.translatesAutoresizingMaskIntoConstraints = false
            settingCellView.backgroundColor = .white
            addArrangedSubview(settingCellView)
            settingCellView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            if i <= 1  {
                let settingProfileImageView = SettingProfileImageView(imageRadius: i == 0 ? 10 : 3, colorNum: i)
                settingProfileImageView.translatesAutoresizingMaskIntoConstraints = false
                settingCellView.addSubview(settingProfileImageView)
                settingProfileImageView.trailingAnchor.constraint(equalTo: settingCellView.trailingAnchor, constant: -40).isActive = true
                settingProfileImageView.centerYAnchor.constraint(equalTo: settingCellView.centerYAnchor).isActive = true
                
                
                let settingCurrentTextLabel = SettingCurrentTextLabel(text: i == 0 ? subText(text: self.profileName) : subText(text: self.repBlogName))
                settingCurrentTextLabel.translatesAutoresizingMaskIntoConstraints = false
                settingCellView.addSubview(settingCurrentTextLabel)
                settingCurrentTextLabel.centerYAnchor.constraint(equalTo: settingCellView.centerYAnchor).isActive = true
                settingCurrentTextLabel.trailingAnchor.constraint(equalTo: settingProfileImageView.leadingAnchor, constant: -10).isActive = true
            }
            else if i == 2 || i == 4 {
                let settingCurrentTextLabel = SettingCurrentTextLabel(text: i == 2 ? self.pushAlarmOn : self.appIsNewVersion)
                settingCurrentTextLabel.translatesAutoresizingMaskIntoConstraints = false
                settingCellView.addSubview(settingCurrentTextLabel)
                settingCurrentTextLabel.centerYAnchor.constraint(equalTo: settingCellView.centerYAnchor).isActive = true
                settingCurrentTextLabel.trailingAnchor.constraint(equalTo: settingCellView.trailingAnchor, constant: -40).isActive = true
            }
            let settingCellSeparator = SettingStackCellSeparatorView()
            settingCellSeparator.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(settingCellSeparator)
            if i == 1 || i == 2 || i == 7 {
                settingCellSeparator.heightAnchor.constraint(equalToConstant: 10).isActive = true
            }
            else {
                settingCellSeparator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            }
           
        }
    }
    
    func setMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = model
    }
    
    func subText(text: String) -> String {
        var subString = text
        if subString.count > 8 {
            subString = String(subString[subString.startIndex ..< subString.endIndex])
            subString += "..."
        }
        return subString
    }
    
    func setAccountSetting(){
        self.profileName = myBlogOfProfileModel.profileName
    }
    
    func setRepBlogSetting() {
        self.repBlogName = myBlogOfProfileModel.repBlogName
    }
    
    func setAlarmSetting() {
        let alarmText = myBlogOfProfileModel.notificationModel[0].pushAlarm == true ? "on" : "off"
        self.pushAlarmOn = "푸시 알림 \(alarmText)"
    }
    
    func setAppInfoSetting() {
        self.appIsNewVersion = "최신 버전 사용 중"
    }
}
