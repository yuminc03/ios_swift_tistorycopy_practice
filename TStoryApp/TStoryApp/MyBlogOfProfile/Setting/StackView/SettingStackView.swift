//
//  SettingStackView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

protocol SettingStackViewDelegate: AnyObject {
    func stackViewCellDidTapped(at: Int, pageTitle: String)
}
class SettingStackView: UIStackView {
    
    weak var delegate: SettingStackViewDelegate?
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    private var profileName: String = ""
    private var repBlogName: String = ""
    private var pushAlarmOn: String = ""
    private var appIsNewVersion: String = ""
    private let settingStackCellNameArr: [String] = ["계정 설정", "대표 블로그 설정", "알림 설정", "공지사항", "앱 정보", "이용약관", "개인정보처리방침", "오픈소스 라이선스", "도움말", "문의하기"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStackView() {
        
        for i in 0 ..< settingStackCellNameArr.count {
            let settingCellView = SettingStackCellView(name: settingStackCellNameArr[i])
            settingCellView.translatesAutoresizingMaskIntoConstraints = false
            settingCellView.tag = i
            settingCellView.backgroundColor = .white
            let gesture = UITapGestureRecognizer(target: self, action: #selector(settingCellViewDidTapped))
            settingCellView.addGestureRecognizer(gesture)
            addArrangedSubview(settingCellView)
            settingCellView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            if i <= 1  {
                let settingProfileImageView = SettingProfileImageView(imageRadius: i == 0 ? 10 : 4, colorNum: i)
                settingProfileImageView.translatesAutoresizingMaskIntoConstraints = false
                settingCellView.addSubview(settingProfileImageView)
                settingProfileImageView.trailingAnchor.constraint(equalTo: settingCellView.trailingAnchor, constant: -40).isActive = true
                settingProfileImageView.centerYAnchor.constraint(equalTo: settingCellView.centerYAnchor).isActive = true
                settingProfileImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
                settingProfileImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
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
                if i == settingStackCellNameArr.count - 1 {
                    settingCellSeparator.isHidden = true
                }
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
            let endIndex : String.Index = subString.index(subString.startIndex, offsetBy: 8)
            subString = String(subString[subString.startIndex ..< endIndex])
            subString += "・・・"
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
        let alarmText = myBlogOfProfileModel.notificationModel.pushAlarm == true ? "on" : "off"
        self.pushAlarmOn = "푸시 알림 \(alarmText)"
    }
    
    func setAppInfoSetting() {
        self.appIsNewVersion = (myBlogOfProfileModel.appVersion == "2.4.8") ? "촤신 버전 사용 중" : "업데이트"
    }
    
    @objc private func settingCellViewDidTapped(gesture: UITapGestureRecognizer) {
        guard let index = gesture.view?.tag else { return }
        delegate?.stackViewCellDidTapped(at: index, pageTitle: settingStackCellNameArr[index])
    }
}
