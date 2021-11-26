//
//  FeedViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/10.
//

import UIKit

class FeedViewController: UIViewController {
    
    var feedModel = FeedModel()
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
    
    lazy var feedTableView: FeedTableView = {
        let tableView = FeedTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "feed_header")
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "feed_cell")
        view.addSubview(tableView)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configulations()
        setConstraints()
    }
    
    private func configulations() {
        let model = FeedModel(
            subscribingNum: 1,
            subscriberNum: 1,
            feedCell: [
                FeedCell(
                    feedTitle: "외상 후 스트레스 장애Posttraumatic Stress Disorder(feat. 영화 와일드 카드로 살펴보는 PTSD)",
                    feedContents: " 1. 현상 영화 '와일드카드'에서는 한 형사(장칠순)가 등장한다. 그는 조폭을 검거하려다가 복부에 칼을 맞는 사고를 당한다.",
                    feedImage: "image1.png",
                    feedLikeNum: 1,
                    feedCommentNum: 0,
                    feedPostedDate: "2021.11.4.",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                ),
                FeedCell(
                    feedTitle: "휴머니즘 광고, 감성속에 숨겨져 있는 자본의 논리(feat. 삼성생명은 당신의 생명이 아닌 당신의 돈에 관심이 있을 뿐)",
                    feedContents: "현대사회는 광고의 홍수라 할 수 있다. 자본주의 첨병으로서 광고는 그 역할을 톡톡히 수행하고 있기에 현대 시대의 생활상과 가치관, 문화를 단적으로 반영한다.",
                    feedImage: "image2.png",
                    feedLikeNum: 1,
                    feedCommentNum: 2,
                    feedPostedDate: "2021.10.27.",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                ),
                FeedCell(
                    feedTitle: "청포도가 생각나는 칠월(feat.이육사의 청포도 제대로 해석하기)",
                    feedContents: "안녕하세요~ 작가 동사힐입니다.😊 청포도 좋아하시나요? 요새는 청포도하면 샤인머스캣이 가장 먼저 떠오르는데요.",
                    feedImage: "image3.png",
                    feedLikeNum: 2,
                    feedCommentNum: 2,
                    feedPostedDate: "2021.10.26.",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                ),
                FeedCell(
                    feedTitle: "내 안의 불안 초조 우울 분노를 파악하는 방법(feat. 코로나 팬데믹 속 '심리 읽어드립니다' 리뷰)",
                    feedContents: "안녕하세요~ 작가 동사힐입니다.😊 어느새 코로나 팬데믹이 2년째 지속되고 있습니다.",
                    feedImage: "image4.png",
                    feedLikeNum: 1,
                    feedCommentNum: 2,
                    feedPostedDate: "2021.10.25.",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                ),
                FeedCell(
                    feedTitle: "Adele의 Easy On Me가사 및 해석(feat. 네 번째 스튜디오 앨범 30의 리드 싱글)",
                    feedContents: "안녕하세요~ 작가 동사힐입니다.😊 오늘은 한국시간으로 2021년 10월 15일 오전 8시에 발표된 아델의 새로운 싱글 Easy On Me의 가사를 함께 살펴보겠습니다.",
                    feedImage: "image5.png",
                    feedLikeNum: 3,
                    feedCommentNum: 0,
                    feedPostedDate: "2021.10.15.",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                ),
                FeedCell(
                    feedTitle: "오래도록 새로운 하루(feat. 단편 웹소설 습작)",
                    feedContents: "안녕하세요~ 작가 동사힐입니다. 기존에 연재하던 웹소설 카트린느 드 메디시스 전기는 잠시 휴재중입니다.",
                    feedImage: "image6.png",
                    feedLikeNum: 2,
                    feedCommentNum: 3,
                    feedPostedDate: "2021.10.15",
                    feedWritedBlogger: "모든 것은 서로 연결되어 있다."
                )
            ]
        )
        
        feedModel = model
        
        
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
            feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedTableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
