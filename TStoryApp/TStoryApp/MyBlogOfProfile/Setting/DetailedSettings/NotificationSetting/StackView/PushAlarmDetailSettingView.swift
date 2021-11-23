//
//  PushAlarmDetailSettingView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/23.
//

import UIKit

class PushAlarmDetailSettingView: UIView {
    
    lazy var commentAlarmSettingView: NotificationCellView = {
        let commentView = NotificationCellView(cellName: "댓글 ・ 답글", switchControlSize: CGRect(x: 330, y: 15, width: 35, height: 15))
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.backgroundColor = .white
        return commentView
    } ()
    lazy var commentAlarmViewBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()

    
    lazy var teamBlogInviteAlarmSettingView: NotificationCellView = {
        let teamBlogView = NotificationCellView(cellName: "팀블로그 초대 ・ 수락", switchControlSize: CGRect(x: 330, y: 15, width: 35, height: 15))
        teamBlogView.translatesAutoresizingMaskIntoConstraints = false
        teamBlogView.backgroundColor = .white
        return teamBlogView
    } ()
    lazy var temaBlogAlarmBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()
    
    
    lazy var subscribeAlarmSettingView: NotificationCellView = {
        let subscribeView = NotificationCellView(cellName: "구독", switchControlSize: CGRect(x: 330, y: 15, width: 35, height: 15))
        subscribeView.translatesAutoresizingMaskIntoConstraints = false
        subscribeView.backgroundColor = .white
        return subscribeView
    } ()
    lazy var subscribeAlarmBottomSeparator: NotificationSettingSeparatorView = {
        let separator = NotificationSettingSeparatorView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    } ()
     
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        
    }
}
