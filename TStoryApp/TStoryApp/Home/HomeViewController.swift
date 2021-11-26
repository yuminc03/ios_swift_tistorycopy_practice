//
//  HomeViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//
//앱 수정사항
//1. home: 그래프 전체화면 dismiss 버튼 액션 (완료!)
//2. home화면을 제외한 다른 화면에서 프로필 버튼 액션 (완료!)
//3. scroll을 일정 이상 내리면 페이지 제목 나타나기 (완료!)
//4. 뒤로가기 버튼 처럼 공통으로 나오는 부분은 tableviewHeader에 넣는 것보다 따로 뻬는게 좋음
//5. 프로필 데이터가 tabBar이동해도 유지되려면 어디에 따로 저장하면 될까?

import UIKit

class HomeViewController: UIViewController {
    
    var homeModel = HomeModel()
    var currentPageIndex: Int = 0
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
    
    lazy var homeTableView: HomeTableView = {
        let tableView = HomeTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configulations()
        setConstraints()
    }

    func configulations() {

        let model = HomeModel(
            topContents: "피드에서 \n새 글을 \n확인해보세요",
            visitModel:
                VisitModel(
                    blogName: "천천히 해도 괜찮아",
                    visitCell:
                        VisitCell(
                            blogUrl: "dpffldk.tistory.com",
                            todayVisitNumber: [
                                VisitNumber(
                                    visitNumWeek: [
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 10
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 14
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 2
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 0
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 0
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 0
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 16
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 3
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 0
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 6
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 2
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 1
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 6
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 5
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 4
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 2
                                        ),
                                        VisitNumberWeek(
                                            todayVisitCount: 12
                                        )
                                    ],
                                    visitNum: 2,
                                    visitIncrement: 0
                                )
                            ],
                            visitInfo: [
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?w=tot&DA=UME&t__nil_searchbox=suggest&sug=&sugo=15&sq=%EC%9D%BC%EC%9D%99+&o=1&q=%EC%9D%BC%EC%9D%98+%EA%B8%B0%EC%81%A8%EA%B3%BC+%EC%8A%AC%ED%94%94",
                                    visitDate: "11. 15. 10:05"
                                ),
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?w=tot&DA=UME&t__nil_searchbox=suggest&sug=&sugo=15&sq=%EC%9D%BC%EC%9D%99+&o=1&q=%EC%9D%BC%EC%9D%98+%EA%B8%B0%EC%81%A8%EA%B3%BC+%EC%8A%AC%ED%94%94",
                                    visitDate: "11. 15. 09:55"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:58"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:57"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:56"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/",
                                    visitDate: "11. 14. 22:56"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/7",
                                    visitDate: "11. 14. 22:56"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/7",
                                    visitDate: "11. 14. 22:55"
                                ),
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?w=tot&DA=UME&t__nil_searchbox=suggest&sug=&sugo=1&sq=%EC%9D%B4%EB%B2%88+%EC%83%9D%EC%9D%80+%ED%8B%80%EB%A0%B8%EB%8B%A4%EA%B3%A0+&o=1&q=%EC%9D%B4%EB%B2%88+%EC%83%9D%EC%9D%80+%ED%8B%80%EB%A0%B8%EB%8B%A4%EA%B3%A0+%EB%8A%90%EA%BB%B4%EC%A7%88+%EB%95%8C",
                                    visitDate: "11. 14. 22:55"
                                ),
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=photoshop+%EA%B7%B8%EB%A6%BC",
                                    visitDate: "11. 14. 22:55"
                                ),
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=photoshop+%EA%B7%B8%EB%A6%BC",
                                    visitDate: "11. 14. 22:54"
                                ),
                                VisitInformation(
                                    visitUrl: "https://dpffldk.tistory.com/5",
                                    visitDate: "11. 14. 22:42"
                                ),
                                VisitInformation(
                                    visitUrl: "https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=%EC%9D%BC%EC%9D%98+%EA%B8%B0%EC%81%A8%EA%B3%BC+%EC%8A%AC%ED%94%94",
                                    visitDate: "11. 14. 22:41"
                                )
                            ],
                            visitKeyWords: [
                                VisitKeyWords(
                                    visitKeyWord: "할로윈 그림",
                                    keyWordCount: 11
                                ),
                                VisitKeyWords(
                                    visitKeyWord: "일의 기쁨과 슬픔",
                                    keyWordCount: 3
                                ),
                                VisitKeyWords(
                                    visitKeyWord: "우주관련글",
                                    keyWordCount: 1
                                ),
                                VisitKeyWords(
                                    visitKeyWord: "일의 기쁨과 슬픔 책",
                                    keyWordCount: 1
                                )
                            ]
                        )
                ),
            recentlyModel: [
                RecentlyModel(
                    postName: "Naver",
                    postUrl: "https://www.naver.com/",
                    likeNum: 0,
                    commentNum: 0
                ),
                RecentlyModel(
                    postName: "Daum",
                    postUrl: "https://www.daum.net/",
                    likeNum: 1,
                    commentNum: 0
                ),
                RecentlyModel(
                    postName: "Google",
                    postUrl: "https://www.google.com/",
                    likeNum: 0,
                    commentNum: 0
                ),
                RecentlyModel(
                    postName: "Youtube",
                    postUrl: "https://www.youtube.com/",
                    likeNum: 1,
                    commentNum: 2
                ),
                RecentlyModel(
                    postName: "Github",
                    postUrl: "https://github.com/",
                    likeNum: 1,
                    commentNum: 0
                ),
                RecentlyModel(
                    postName: "Kakao freinds shop",
                    postUrl: "https://store.kakaofriends.com/index/today",
                    likeNum: 1,
                    commentNum: 0
                ),
                RecentlyModel(
                    postName: "Facebook",
                    postUrl: "https://www.facebook.com/",
                    likeNum: 1,
                    commentNum: 2
                ),
                RecentlyModel(
                    postName: "Mirim Grils Information Science High School",
                    postUrl: "https://www.e-mirim.hs.kr/main.do",
                    likeNum: 1,
                    commentNum: 1
                ),
            ],
            popularityModel: [
                PopularityModel(
                    postName: "Photoshop으로 할로윈 토끼 그림 그리기",
                    postImageName: "postImage1.png",
                    postViewsNum: 11
                ),
                PopularityModel(
                    postName: "일의 기쁨과 슬픔을 읽어보았습니다",
                    postImageName: "postImage2.png",
                    postViewsNum: 3
                ),
                PopularityModel(
                    postName: "Photoshop으로 우주의 소녀 그림그리기",
                    postImageName: "postImage3.png",
                    postViewsNum: 2
                ),
                PopularityModel(
                    postName: "보석느낌 펜던트만들기",
                    postImageName: "postImage4.png",
                    postViewsNum: 1
                ),
                PopularityModel(
                    postName: "코로나 백신 1차, 2차 접종완료했습니다",
                    postImageName: "postImage5.png",
                    postViewsNum: 1
                )
            ],
            subscriberModel: [
                SubscriberModel(
                    subscriberName: "동사힐",
                    blogName: "모든 것은 서로 연결되어 있다.",
                    backgroundImageName: "backgroundImage1.png",
                    profileImageName: "profileImage1.png"
                ),
                SubscriberModel()
            ]
        )
        homeModel = model
        
        
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
            appVersion: "2.4.8",
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
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
