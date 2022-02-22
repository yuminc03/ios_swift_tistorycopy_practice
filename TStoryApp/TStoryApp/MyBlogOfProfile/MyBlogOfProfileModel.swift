//
//  MyBlogOfProfileModel.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/17.
//

struct MyBlogOfProfileModel {//프로필 정보
    var profileName: String = "" //프로필 이름
    var profileEmail: String = "" //프로필 이메일
    var repBlogName: String = "" //대표 블로그 이름
    var appVersion: String = ""
    var myBlogsModel: [MyBlogsModel] = []
    var notificationModel = NotificationModel()
    var announcementModel: [AnnouncementModel] = []
}

struct MyBlogsModel {
    var blogName: String = "" //블로그 이름
    var blogUrl: String = "" //블로그 링크
}

struct NotificationModel {//알림
    var pushAlarm: Bool = true //푸시알림
    var commentAlarm: Bool = true //댓글알림
    var teamBlogInviteAlarm: Bool = true //팀 블로그 초대 알림
    var subscibeAlarm: Bool = true //구독알림
    var doNotdisturbMode: Bool = false //방해금지 모드
}

struct AnnouncementModel {//공지사항
    var announceTitle: String = "" //공지 제목
    var announceImageName: String? = "" //공지 사진이름
    var announceLikeNum: Int = 0 //공지 좋아요 수
    var announceCommentNum: Int = 0 //공지 댓글 수
    var announceDate: String = "" //공지 날짜
}
