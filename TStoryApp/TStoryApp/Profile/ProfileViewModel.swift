//
//  ProfileViewModel.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/02/22.
//

import Foundation

class ProfileViewModel {
    
    var profileModel = ProfileModel() //프로필
    var blogSearchModel = BlogSearchModel() //블로그 검색 기능
    var myBlogOfProfileModel = MyBlogOfProfileModel() //블로그 상단 프로필
    var selectedCateogoryIndex: Int = 0 // 현재 선택된 category index
    
    func configulations() {
        profileModel.profileTitle = "천천히 해도 괜찮아"
        profileModel.subscribeNum = 1
        profileModel.profileUrl = "https://dpffldk.tistory.com"
        
        //카테고리 모델 생성
        //0번째 -> 분류 전체보기
        //1번째 -> 책
        //2번째 -> 레진아트
        //3번째 -> 그림
        //4번째 -> 일상
        //각 카테고리 별 컨텐츠 생성
        //0번째 = 분류 전체보기 컨텐츠 생성
        //1번째 = 책 컨텐츠 생성
        //2번째 = 레진아트 생성
        //3번째 = 그림 생성
        //4번째 = 일상 생성
        
        let model = ProfileModel(
            profileTitle: "천천히 해도 괜찮아",
            profileUrl: "https://dpffldk.tistory.com",
            profileImageName: "backgroundImage1.png",
            subscribeNum: 1,
            category: [
                ProfileCategory(
                    categoryName: "분류 전체보기",
                    categoryNum: 6,
                    isSelected: true,
                    categoryCell: [
                        ProfileCategoryCell(
                            cellTitle: "Photoshop으로 할로윈 토끼 그림 그리기",
                            cellImageName: "image1.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.10.31."),
                        ProfileCategoryCell(
                            cellTitle: "이번 생은 틀렸다고 느껴질 때를 읽어보았습니다",
                            cellImageName: "image2.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.9.20."),
                        ProfileCategoryCell(
                            cellTitle: "코로나 백신 1차, 2차 접종완료했습니다",
                            cellImageName: "image3.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.8.14."),
                        ProfileCategoryCell(
                            cellTitle: "일의 기쁨과 슬픔을 읽어보았습니다",
                            cellImageName: "image4.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.8.9."),
                        ProfileCategoryCell(
                            cellTitle: "Photoshop으로 우주의 소녀 그림 그리기",
                            cellImageName: "image5.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.25."),
                        ProfileCategoryCell(
                            cellTitle: "보석 느낌 펜던트 만들기",
                            cellImageName: "image6.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.7.11."),
                        ProfileCategoryCell(
                            cellTitle: "화양연화 THE NOTES 1을 읽어보았습니다",
                            cellImageName: "image7.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.10.")
                    ]
                ),
                ProfileCategory(
                    categoryName: "책",
                    categoryNum: 3,
                    categoryCell: [
                        ProfileCategoryCell(
                            cellTitle: "이번 생은 틀렸다고 느껴질 때",
                            cellImageName: "image1.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.9.20"),
                        ProfileCategoryCell(
                            cellTitle: "일의 기쁨과 슬픔",
                            cellImageName: "image3.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.8.9."),
                        ProfileCategoryCell(
                            cellTitle: "화양연화 THE NOTES 1",
                            cellImageName: "image6.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.10.")
    
                        
                    ]
                ),
                ProfileCategory(
                    categoryName: "레진아트",
                    categoryNum: 1,
                    categoryCell: [
                        ProfileCategoryCell(
                            cellTitle: "보석 느낌 펜던트 만들기",
                            cellImageName: "image5.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.7.11.")
                    ]
                ),
                ProfileCategory(
                    categoryName: "그림",
                    categoryNum: 1,
                    categoryCell: [
                        ProfileCategoryCell(
                            cellTitle: "Photoshop으로 할로윈 토끼 그림 그리기",
                            cellImageName: "image1.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.10.31."),
                        ProfileCategoryCell(
                            cellTitle: "Photoshop으로 우주의 소녀 그리기",
                            cellImageName: "image4.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.25.")
                    ]
                ),
                ProfileCategory(
                    categoryName: "일상",
                    categoryNum: 1,
                    categoryCell: [
                        ProfileCategoryCell(
                            cellTitle: "코로나 1차, 2차 백신 접종 완료!",
                            cellImageName: "image2.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.8.14.")
                    ]
                )
            ]
        )
        profileModel = model
        
        
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
}
