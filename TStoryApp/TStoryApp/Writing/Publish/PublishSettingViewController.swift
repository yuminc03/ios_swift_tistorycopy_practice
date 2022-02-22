//
//  PublishingSettingViewcontroller1.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/05.
//

import UIKit

protocol PublishSettingViewDelgate: AnyObject {
    func publishSettingViewControllerDismiss(_ controller: PublishSettingViewController, writeTitleText: String, sortingIndex: Int, publishTag: String, categoryName: String, publishSettingIndex: Int, homeSubject: String, publishDateIndex: Int, publishDate: String, publishHour: String, commentAllow: Bool, passwordText: String)
}
class PublishSettingViewController: UIViewController {
    
    var writeFormModel = WriteFormModel()
    weak var delegate: PublishSettingViewDelgate?
    var isExtended: Bool = false
    var selectedIndex: Int = 0
    var contentsSortingIndex: Int = 0
    
    var homeSubject: String = ""
    var homeSubjectName: String = "선택 안 함"
    var publishSettingIndex: Int = 0
    var publishDateIndex: Int = 0
    
    lazy var contentView: PublishSettingView = {
        let contentView = PublishSettingView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.postingSelectorCellHeaderView.delegate = self
        contentView.postingSelectorCellView.delegate = self
        contentView.backgroundColor = .white
        contentView.headerView.setTitleTextFieldText(title: writeFormModel.publishSettingForm[0].publishTitleText)
        contentView.headerView.setPublishTagText(tag: writeFormModel.publishSettingForm[0].publishTagText)
        contentView.headerView.setCategorySelectionButtonText(name: writeFormModel.publishSettingForm[0].publishCategoryName)
        contentView.postingSelectorCellHeaderView.setPublishSettingIndex(index: writeFormModel.publishSettingForm[0].publishSettingIndex)
        contentView.postingSelectorCellView.setHomeSubject(name: writeFormModel.publishSettingForm[0].publishSubject)
        contentView.postingSelectorCellView.setPublishDateIndex(index: writeFormModel.publishSettingForm[0].selectedDate)
        contentView.postingSelectorCellView.setCommentAllow(allow: writeFormModel.publishSettingForm[0].allowComment)
        contentView.postingSelectorCellView.setPassword(text: writeFormModel.publishSettingForm[0].protectPassWord)
     
        contentView.topView.previousButton.addTarget(self, action: #selector(previousButtonDidTapped), for: .touchUpInside)
        contentView.headerView.categorySelectionButton.addTarget(self, action: #selector(categorySelectionButtonDidTapped), for: .touchUpInside)
        contentView.postingSelectorCellView.homeSubjectView.homeSubjectButton.addTarget(self, action: #selector(homeSubjectButtonDidTapped), for: .touchUpInside)
        contentView.headerView.tagLabel.isUserInteractionEnabled = true
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(tagLabelDidTapped))
        contentView.headerView.tagLabel.addGestureRecognizer(tagGesture)
        
        view.addSubview(contentView)
        return contentView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        selectedIndex = self.publishSettingIndex
        homeSubject = self.homeSubjectName
        self.publishDateIndex == 0 ? (isExtended = false) : (isExtended = true)
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: homeSubject, hasAdditionalDate: isExtended)
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func categorySelectionButtonDidTapped(button: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = CategorySelectionViewController()
        vc.delegate = self
        let categoryButtonTitle = contentView.headerView.getCategorySelectionButtonText()
        vc.setCategoryName(name: categoryButtonTitle)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @objc func tagLabelDidTapped(gesture: UITapGestureRecognizer) {
        let vc = ContentTagInputViewController()
        let tag = writeFormModel.publishSettingForm[0].publishTagText
        vc.setPublishTag(tag: tag)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc private func homeSubjectButtonDidTapped(button: UIButton) {
        let vc = HomeSubjectSelectorViewController()
        vc.delegate = self
        vc.setHomeSubject(name: homeSubject)
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    func setWriteFormModel(writeFormModel: WriteFormModel) {
        self.writeFormModel = writeFormModel
    }
    
    func setWriteTitle(title: String) {
        self.writeFormModel.publishSettingForm[0].publishTitleText = title
    }
    
    func setPublishTagText(tag: String){
        self.writeFormModel.publishSettingForm[0].publishTagText = tag
    }
    
    func setContentsSortingIndex(index: Int) {
        self.contentsSortingIndex = index
    }
    
    func setPublishSettingIndex(index: Int) {
        self.publishSettingIndex = index
        self.writeFormModel.publishSettingForm[0].publishSettingIndex = index
    }
    
    func setHomeSubject(name: String) {
        self.homeSubjectName = name
        self.writeFormModel.publishSettingForm[0].publishSubject = name
    }
    
    func setPublishDateIndex(index: Int) {
        self.publishDateIndex = index
        self.writeFormModel.publishSettingForm[0].selectedDate = index
    }
    
    @objc func previousButtonDidTapped(button: UIButton) {
        let titleText = contentView.headerView.getTitleTextFieldText()
        let sortingIndex = contentsSortingIndex
        let publishTag = contentView.headerView.getPublishTagText()
        let categoryName = contentView.headerView.getCategorySelectionButtonText()
        let publishSettingIndex = contentView.postingSelectorCellHeaderView.getPublishSettingIndex()
        let homeSubject = contentView.postingSelectorCellView.homeSubjectView.getHomeSubject()
        let publishDateIndex = contentView.postingSelectorCellView.getPublishDateIndex()
        let publishDate = contentView.postingSelectorCellView.publishReservationDateView.getPublishDate()
        let publishHour = contentView.postingSelectorCellView.publishReservationDateView.getPublishHour()
        let commentAllow = contentView.postingSelectorCellView.commentAllowView.getCommentAllow()
        let password = contentView.postingSelectorCellView.passwordView.getPassword()
        delegate?.publishSettingViewControllerDismiss(self, writeTitleText: titleText, sortingIndex: sortingIndex, publishTag: publishTag, categoryName: categoryName, publishSettingIndex: publishSettingIndex, homeSubject: homeSubject, publishDateIndex: publishDateIndex, publishDate: publishDate, publishHour: publishHour, commentAllow: commentAllow, passwordText: password)
    }
}
