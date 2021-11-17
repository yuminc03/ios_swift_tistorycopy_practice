//
//  ProfileViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit


class ProfileViewController: UIViewController {
    var profileModel = ProfileModel()
    var selectedCateogoryIndex: Int = 0
    
    lazy var navigationBarView: NavigationBarView = {
        let navigationView = NavigationBarView()
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = navigationView
        self.navigationItem.titleView?.tintColor = .clear
        navigationView.blogSearchButton.setTitleColor(.white, for: .normal)
        view.addSubview(navigationView)
        return navigationView
    } ()
    
    lazy var profileView: ProfileView = {
       let profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.delegate = self
        profileView.dataSource = self
        view.addSubview(profileView)
        return profileView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        configuration()
    }
    
    func updateUI() {//category를 바꾸었을 때 호출!
        profileView.reloadData()
    }
    
    
    private func configuration() {
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
                            cellTitle: "이번 생은 틀렸다고 느껴질 때를 읽어보았습니다",
                            cellImageName: "image1.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.9.20"),
                        ProfileCategoryCell(
                            cellTitle: "코로나 백신 1차, 2차 접종완료했습니다",
                            cellImageName: "image2.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.8.14."),
                        ProfileCategoryCell(
                            cellTitle: "일의 기쁨과 슬픔을 읽어보았습니다",
                            cellImageName: "image3.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.8.9."),
                        ProfileCategoryCell(
                            cellTitle: "Photoshop으로 우주의 소녀 그림 그리기",
                            cellImageName: "image4.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.25."),
                        ProfileCategoryCell(
                            cellTitle: "보석 느낌 펜던트 만들기",
                            cellImageName: "image5.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.7.11."),
                        ProfileCategoryCell(
                            cellTitle: "화양연화 THE NOTES 1을 읽어보았습니다",
                            cellImageName: "image6.png",
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
//        print(profileModel.category[0].categoryCell.count)
//        print(profileModel.profileTitle)
//        print(profileModel.profileUrl)
        
        
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
}

extension ProfileViewController: CategoryKindPopoverViewControllerDelegate {
    func categoryDidTapped(_ viewController: CategoryKindPopoverViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let at = at else { return }//at이 null값이 아닐 때만 밑의 로직을 실행
        selectedCateogoryIndex = at
        for i in 0 ..< profileModel.category.count {
            profileModel.category[i].isSelected = false
        }
        profileModel.category[at].isSelected = true
        
        profileView.reloadData()
    }
}
