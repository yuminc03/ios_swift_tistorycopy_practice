//
//  HomeSubjectSelectorViewContoller.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/09.
//

import UIKit

protocol HomeSubjectSelectorViewControllerDelegate : AnyObject {
    func homeSubjectSelectorDidTapped(_ viewController: HomeSubjectSelectorViewController, subjectName: String?)
}
class HomeSubjectSelectorViewController: UIViewController {
    
    weak var delegate: HomeSubjectSelectorViewControllerDelegate?
    var publishSubject: String = "선택 안 함"
    var homeSubjectModel = HomeSubjectModel()
    
    lazy var homeSubjectView: HomeSubjectSelectorView = {
        let homeSubjectView = HomeSubjectSelectorView()
        homeSubjectView.translatesAutoresizingMaskIntoConstraints = false
        homeSubjectView.backgroundColor = .white
        homeSubjectView.layer.cornerRadius = 20
        homeSubjectView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        homeSubjectView.delegate = self
        homeSubjectView.homeSubjectCollectionView.dataSource = self
        homeSubjectView.homeSubjectCollectionView.delegate = self
        view.addSubview(homeSubjectView)
        return homeSubjectView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configulation()
        setConstraints()
    }
    
    func configulation() {
        let model = HomeSubjectModel(
            homeSubjectHeader: [
                HomeSubjectHeader(
                    homeSubjectTitle: " ",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "선택 안 함"
                        )
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "라이프",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "일상다반사"
                        ),HomeSubjectCell(
                            homeSubjectName: "해외생활"
                        ),HomeSubjectCell(
                            homeSubjectName: "연애・결혼"
                        ),HomeSubjectCell(
                            homeSubjectName: "육아"
                        ),HomeSubjectCell(
                            homeSubjectName: "생활정보"
                        ),HomeSubjectCell(
                            homeSubjectName: "반려동물"
                        ),HomeSubjectCell(
                            homeSubjectName: "취미"
                        ),HomeSubjectCell(
                            homeSubjectName: "사진"
                        ),HomeSubjectCell(
                            homeSubjectName: "요리"
                        ),HomeSubjectCell(
                            homeSubjectName: "자동차"
                        ),HomeSubjectCell(
                            homeSubjectName: "인테리어"
                        ),HomeSubjectCell(
                            homeSubjectName: "패션뷰티"
                        ),HomeSubjectCell(
                            homeSubjectName: "건강"
                        ),HomeSubjectCell(
                            homeSubjectName: "군대"
                        ),
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "여행・맛집",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "국내여행"
                        ),HomeSubjectCell(
                            homeSubjectName: "해외여행"
                        ),HomeSubjectCell(
                            homeSubjectName: "캠핑・등산"
                        ),HomeSubjectCell(
                            homeSubjectName: "맛집"
                        ),HomeSubjectCell(
                            homeSubjectName: "카페・디저트"
                        )
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "문화・연예",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "TV"
                        ),HomeSubjectCell(
                            homeSubjectName: "스타"
                        ),HomeSubjectCell(
                            homeSubjectName: "영화"
                        ),HomeSubjectCell(
                            homeSubjectName: "음악"
                        ),HomeSubjectCell(
                            homeSubjectName: "책"
                        ),HomeSubjectCell(
                            homeSubjectName: "만화・애니"
                        ),HomeSubjectCell(
                            homeSubjectName: "공연・전시・축제"
                        ),HomeSubjectCell(
                            homeSubjectName: "창작"
                        )
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "IT",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "IT 인터넷"
                        ),HomeSubjectCell(
                            homeSubjectName: "모바일"
                        ),HomeSubjectCell(
                            homeSubjectName: "게임"
                        ),HomeSubjectCell(
                            homeSubjectName: "과학"
                        ),HomeSubjectCell(
                            homeSubjectName: "IT 제품리뷰"
                        )
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "스포츠",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "스포츠일반"
                        ),HomeSubjectCell(
                            homeSubjectName: "축구"
                        ),HomeSubjectCell(
                            homeSubjectName: "야구"
                        ),HomeSubjectCell(
                            homeSubjectName: "농구"
                        ),HomeSubjectCell(
                            homeSubjectName: "배구"
                        ),HomeSubjectCell(
                            homeSubjectName: "골프"
                        )
                    ]
                ),
                HomeSubjectHeader(
                    homeSubjectTitle: "시사",
                    homeSubjectCategory: [
                        HomeSubjectCell(
                            homeSubjectName: "정치"
                        ),HomeSubjectCell(
                            homeSubjectName: "사회"
                        ),HomeSubjectCell(
                            homeSubjectName: "교육"
                        ),HomeSubjectCell(
                            homeSubjectName: "국제"
                        ),HomeSubjectCell(
                            homeSubjectName: "경제"
                        ),HomeSubjectCell(
                            homeSubjectName: "경영・직장"
                        )
                    ]
                )
            ]
        )
        
        homeSubjectModel = model
    }
    
    private func setConstraints() {
        view.backgroundColor = .black.withAlphaComponent(0.2)
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewBackgroundDidTapped))
//        view.addGestureRecognizer(gesture)
        NSLayoutConstraint.activate([
            homeSubjectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeSubjectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeSubjectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeSubjectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setHomeSubject(name: String) {
        self.publishSubject = name
    }
    
//    @objc private func viewBackgroundDidTapped(gesture: UITapGestureRecognizer) {
//        let location = gesture.location(in: self.view)
//        if homeSubjectView.frame.contains(location) {
//            return
//        }
//        else {
//            delegate?.homeSubjectSelectorDidTapped(self, subjectName: nil)
//        }
//    }
}
