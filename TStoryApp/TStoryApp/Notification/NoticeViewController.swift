//
//  FeedController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var noticeModel = NoticeModel()
    var selectedCategoryIndex: Int = 0
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    var blogSearchModel = BlogSearchModel()
    
    lazy var navigationBarView: NavigationBarView = {
        let navigationView = NavigationBarView()
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = navigationView
        self.navigationItem.titleView?.tintColor = .white
        navigationView.blogSearchButton.addTarget(self, action: #selector(blogSearchButtonDidTapped), for: .touchUpInside)
        navigationView.blogProfileButton.addTarget(self, action: #selector(blogProfileButtonDidTapped), for: .touchUpInside)
        view.addSubview(navigationView)
        return navigationView
    } ()
    
    lazy var feedView: NoticeTableView = {
        let feedView = NoticeTableView()
        feedView.translatesAutoresizingMaskIntoConstraints = false
        feedView.delegate = self
        feedView.dataSource = self
        view.addSubview(feedView)
        return feedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        configulation()
    }
    
    func updateUI() {
        feedView.reloadData()
    }
    
    func configulation(){
        let model = NoticeModel(
            noticeCategory: [
                NoticeCategory(
                    categoryName: "전체 알림",
                    isSelected: true,
                    noticeCell: [
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image1.png",
                            cellContent: "\"엘리아님! 심리 읽어드립니다 책 혹시 읽고 싶으면 저에게 찾아오세요! 선물로 드릴...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.11.1."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image2.png",
                            cellContent: "\"고등학교 졸업 전에 자신의 경험을 잘 정리해놓으면,취업을 할 때에도 유용...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.8.24."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 일의 기쁨과 슬픔을 읽어보았습니다에 댓글을 남겼습니다.",
                            cellImage: "image3.png",
                            cellContent: "\"엘리아님도 패시브 인컴을 구축해서 적게 일하시고 많이 버세요!\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.8.10"
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image4.png",
                            cellContent: "\"엘리아님! 댓글 감사합니다! 블로그를 통해 엘리아님 금손 실력에 깜놀합니다!...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.7.27."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 보석느낌 펜던트만들기에 댓글을 남겼습니다.",
                            cellImage: "image5.png",
                            cellContent: "\"안녕하세요! 레진아트 잘 보았습니다^^ 이미지 올릴 때 용량을 줄이면 포스팅한...\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.7.12."
                        )
                    ]
                ),
                NoticeCategory(
                    categoryName: "구독 알림",
                    noticeCell: []
                ),
                NoticeCategory(
                    categoryName: "댓글 알림",
                    noticeCell: [
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image1.png",
                            cellContent: "\"엘리아님! 심리 읽어드립니다 책 혹시 읽고 싶으면 저에게 찾아오세요! 선물로 드릴...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.11.1."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image2.png",
                            cellContent: "\"고등학교 졸업 전에 자신의 경험을 잘 정리해놓으면,취업을 할 때에도 유용...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.8.24."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 일의 기쁨과 슬픔을 읽어보았습니다에 댓글을 남겼습니다.",
                            cellImage: "image3.png",
                            cellContent: "\"엘리아님도 패시브 인컴을 구축해서 적게 일하시고 많이 버세요!\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.8.10"
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image4.png",
                            cellContent: "\"엘리아님! 댓글 감사합니다! 블로그를 통해 엘리아님 금손 실력에 깜놀합니다!...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.7.27."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 보석느낌 펜던트만들기에 댓글을 남겼습니다.",
                            cellImage: "image5.png",
                            cellContent: "\"안녕하세요! 레진아트 잘 보았습니다^^ 이미지 올릴 때 용량을 줄이면 포스팅한...\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.7.12."
                        )
                    ]
                )
            ]
        )
        noticeModel = model
        
        
        blogSearchModel = BlogSearchModel(
        searchResultModal: [
            SearchResultModel(
                searchWords: "swift",
                searchDate: "11. 22."
            ),
            SearchResultModel(
                searchWords: "ㄹㄹㅅㅎㄹㄱ",
                searchDate: "11. 17."
            ),
            SearchResultModel(
                searchWords: "알바천국",
                searchDate: "11. 16."
            )
        ])
        
        
        myBlogOfProfileModel = MyBlogOfProfileModel(
            profileName: "엘리아",
            profileEmail: "yuminc03@gmail.com",
            repBlogName: "천천히 해도 괜찮아",
            appVersion: "2.4.7",
            myBlogsModel: [
                MyBlogsModel(
                    blogName: "천천히 해도 괜찮아",
                    blogUrl: "dpffldk.tistory.com"
                )
            ],
            notificationModel:
                NotificationModel(
                    pushAlarm: true,
                    commentAlarm: true,
                    teamBlogInviteAlarm: true,
                    subscibeAlarm: true,
                    doNotdisturbMode: false
                ),
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
                ),
                AnnouncementModel(
                    announceTitle: "[안내] 티스토리 개인정보처리방침 변경 안내",
                    announceImageName: "image4.png",
                    announceLikeNum: 23,
                    announceCommentNum: 7,
                    announceDate: "2021. 8. 2."
                ),
                AnnouncementModel(
                    announceTitle: "[안내] 수익 기능이 다양해졌습니다.",
                    announceImageName: "image5.png",
                    announceLikeNum: 118,
                    announceCommentNum: 76,
                    announceDate: "2021. 7. 27"
                ),
                AnnouncementModel(
                    announceTitle: "[수익 사용법] 텐핑 광고 설정하기",
                    announceImageName: "image6.png",
                    announceLikeNum: 17,
                    announceCommentNum: 6,
                    announceDate: "2021. 7. 14."
                )
            ]
        )
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    @objc private func blogProfileButtonDidTapped(button: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = MyBlogOfProfileViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    @objc private func blogSearchButtonDidTapped(button: UIButton) {
        let vc = BlogSearchViewController(blogSearchModel: self.blogSearchModel)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}

