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
    
    lazy var feedView: FeedTableView = {
        let feedView = FeedTableView()
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
                            cellContent: "\"고등학교 졸업 전에 자신의 경험을 잘 정리해놓으면,취업을 할 때에도 유용...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.8.24."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 일의 기쁨과 슬픔을 읽어보았습니다에 댓글을 남겼습니다.",
                            cellImage: "image2.png",
                            cellContent: "\"엘리아님도 패시브 인컴을 구축해서 적게 일하시고 많이 버세요!\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.8.10"
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image3.png",
                            cellContent: "\"엘리아님! 댓글 감사합니다! 블로그를 통해 엘리아님 금손 실력에 깜놀합니다!...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.7.27."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 보석느낌 펜던트만들기에 댓글을 남겼습니다.",
                            cellImage: "image4.png",
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
                            cellContent: "\"고등학교 졸업 전에 자신의 경험을 잘 정리해놓으면,취업을 할 때에도 유용...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.8.24."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 일의 기쁨과 슬픔을 읽어보았습니다에 댓글을 남겼습니다.",
                            cellImage: "image2.png",
                            cellContent: "\"엘리아님도 패시브 인컴을 구축해서 적게 일하시고 많이 버세요!\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.8.10"
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 엘리아님에게 답글을 남겼습니다.",
                            cellImage: "image3.png",
                            cellContent: "\"엘리아님! 댓글 감사합니다! 블로그를 통해 엘리아님 금손 실력에 깜놀합니다!...\"",
                            cellFeedSender: "모든 것은 서로 연결되어 있다.",
                            cellFeedDate: "2021.7.27."
                        ),
                        NoticeCell(
                            cellTitle: "동사힐님이 보석느낌 펜던트만들기에 댓글을 남겼습니다.",
                            cellImage: "image4.png",
                            cellContent: "\"안녕하세요! 레진아트 잘 보았습니다^^ 이미지 올릴 때 용량을 줄이면 포스팅한...\"",
                            cellFeedSender: "천천히 해도 괜찮아",
                            cellFeedDate: "2021.7.12."
                        )
                    ]
                )
            ]
        )
        noticeModel = model
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension NoticeViewController: CategoryKindViewControllerDelegate {
    func categoryDidTapped(_ viewController: CategoryKindViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        
        guard let at = at else { return }
        selectedCategoryIndex = at
        for i in 0 ..< noticeModel.noticeCategory.count {
            noticeModel.noticeCategory[i].isSelected = false
        }
        noticeModel.noticeCategory[at].isSelected = true
        feedView.reloadData()
    }
}
