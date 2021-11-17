//
//  MyBlogOfProfileView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/17.
//

import UIKit

class MyBlogOfProfileViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    lazy var myBlogOfProfileView: MyBlogOfProfileView = {
        let blogOfProfileView = MyBlogOfProfileView()
        blogOfProfileView.translatesAutoresizingMaskIntoConstraints = false
        blogOfProfileView.backgroundColor = .white
        blogOfProfileView.myBlogOfProfileTableView.delegate = self
        blogOfProfileView.myBlogOfProfileTableView.dataSource = self
        view.addSubview(blogOfProfileView)
        return blogOfProfileView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstriants()
        configulations()
    }
    
    func configulations() {
        let model = MyBlogOfProfileModel(
            profileName: "엘리아",
            profileEmail: "yuminc03@gmail.com",
            repBlogName: "천천히 해도 괜찮아",
            myBlogsModel: [
                MyBlogsModel(
                    blogName: "천천히 해도 괜찮아",
                    blogUrl: "dpffldk.tistory.com"
                )
            ],
            notificationModel: [
                NotificationModel(
                    pushAlarm: true,
                    commentAlarm: true,
                    teamBlogInviteAlarm: true,
                    subscibeAlarm: true,
                    doNotdisturbMode: false
                )
            ],
            announcementModel: [
                AnnouncementModel(
                    announceTitle: "[안내] 모바일웹이 개선되었습니다.",
                    announceImageName: "image1.png",
                    announceLikeNum: 94,
                    announceCommentNum: 95,
                    announceDate: "2021. 10. 12."
                ),
                AnnouncementModel(
                    announceTitle: "[참고] 2차 도메인이 루트도메인인지 확인하는 방법.",
                    announceImageName: "image2.png",
                    announceLikeNum: 17,
                    announceCommentNum: 8,
                    announceDate: "2021. 9. 1."
                ),
                AnnouncementModel(
                    announceTitle: "[안내] abs.txt 파일 문제가 해결됐습니다.",
                    announceImageName: "image3.png",
                    announceLikeNum: 81,
                    announceCommentNum: 65,
                    announceDate: "2021. 9. 1."
                )
            ]
        )
        myBlogOfProfileModel = model
        
    }
    
    private func setConstriants() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        NSLayoutConstraint.activate([
            myBlogOfProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myBlogOfProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myBlogOfProfileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
