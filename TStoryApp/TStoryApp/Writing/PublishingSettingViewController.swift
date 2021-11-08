//
//  PublishingSettingViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/29.
//

import UIKit
// CollectionView를 공부해보자!
//#태그는 textView에서 엔터누르면 태그가 나타나도록! 한 개만!
//댓글 허용은 switch만 만들자
protocol PublishingSettingDelegate: AnyObject {
    func dismissSettingView(_ controller: PublishingSettingViewController, writeTitleText: String, publishTagText: String, categoryText: String, openSettingTextIndex: Int, publishDateIndex: Int, allowComment: Bool, passWordText: String)
}

class PublishingSettingViewController: UIViewController {
    
    var writeFormModel: [WriteFormModel] = []
    weak var delegate: PublishingSettingDelegate?

    var categoryText: String = ""
    var selectedIndex: Int = 0
    var selectedPublishingDateIndex: Int = 0
    var publishDate: String = ""
    var passWordText: String = ""
    
    lazy var publishingView: PublishingSettingView = {
        let publishingView = PublishingSettingView()
        publishingView.translatesAutoresizingMaskIntoConstraints = false
        publishingView.backgroundColor = .white
        
        let settingHeaderGesture = UITapGestureRecognizer(target: self, action: #selector(settingBackViewDidTapped))
        publishingView.settingHeaderView.settingBackView.addGestureRecognizer(settingHeaderGesture)
        
        publishingView.postContentsSettingView.setWriteFormData(writeFormModel: self.writeFormModel)
        publishingView.postContentsSettingView.setPostTitle(postTitle: writeFormModel[0].publishSettingForm[0].publishTitleText)
        publishingView.postContentsSettingView.setPostTag(postTag: writeFormModel[0].publishSettingForm[0].publishTagText)
        
        let postContentSettingViewGuesture = UITapGestureRecognizer(target: self, action: #selector(postTagLabelDidTapped))
        publishingView.postContentsSettingView.postTagLabel.isUserInteractionEnabled = true
        publishingView.postContentsSettingView.postTagLabel.addGestureRecognizer(postContentSettingViewGuesture)
    
        publishingView.categoryView.setWriteFormData(writeFormModel: self.writeFormModel)
        publishingView.categoryView.setCategoryNameButtonText(text: writeFormModel[0].publishSettingForm[0].publishCategoryName)
        publishingView.categoryView.categoryChoiceButton.addTarget(self, action: #selector(categorySettingButtonDidTapped), for: .touchUpInside)
        
        let openGesture = UITapGestureRecognizer(target: self, action: #selector(openSettingViewDidTapped))
        let protectGesture = UITapGestureRecognizer(target: self, action: #selector(openSettingViewDidTapped))
        let privateGesture = UITapGestureRecognizer(target: self, action: #selector(openSettingViewDidTapped))
        publishingView.openSettingView.openSettingOpenView.addGestureRecognizer(openGesture)
        publishingView.openSettingView.openSettingProtectView.addGestureRecognizer(protectGesture)
        publishingView.openSettingView.openSettingPrivateView.addGestureRecognizer(privateGesture)
        publishingView.openSettingView.setWriteFormData(writeFormModel: self.writeFormModel)
        publishingView.openSettingView.setOpenSettingIndex(index: self.writeFormModel[0].publishSettingForm[0].publishSettingIndex)
        
        view.addSubview(publishingView)
        return publishingView
    }()
    
    lazy var stackView: OpenSettingStackView = {
        let stackView = OpenSettingStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 25
//        stackView.setWriteFormData(writeFormData: self.writeFormModel)

//        stackView.homeSubjectView.setHomeSubject(subjectText: writeFormModel[0].publishSettingForm[0].publishSubject)
//        let homeSubjectGesture = UITapGestureRecognizer(target: self, action: #selector(homeSubjectButtonDidTapped))
//        stackView.homeSubjectView.homeSubjectButton.addGestureRecognizer(homeSubjectGesture)
//
//        let currentGesture = UITapGestureRecognizer(target: self, action: #selector(publishLabelDidTapped))
//        stackView.publishDateStackView.publishCurrentLabel.addGestureRecognizer(currentGesture)
//        let reservationGesture = UITapGestureRecognizer(target: self, action: #selector(publishLabelDidTapped))
//        stackView.publishDateStackView.publishReservationLabel.addGestureRecognizer(reservationGesture)
//        stackView.publishDateStackView.setWriteFormModel(writeFormModel: self.writeFormModel)
//        stackView.publishDateStackView.setPublishDateIndex(index: writeFormModel[0].publishSettingForm[0].selectedDate)
//
//        stackView.commentIsAllowView.setallowCommentSwitch(allow: self.writeFormModel[0].publishSettingForm[0].allowComment)
//        stackView.commentIsAllowView.allowCommentSwitch.addTarget(self, action: #selector(allowCommentSwitchDidTapped), for: UIControl.Event.valueChanged)

//        stackView.passWordView.setPassWord(text: writeFormModel[0].publishSettingForm[0].protectPassWord)
        view.addSubview(stackView)
        return stackView
    } ()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        openSettingViewColor(index: self.writeFormModel[0].publishSettingForm[0].publishSettingIndex, isSelected: true)
//        stackView.setStackView(tag: self.writeFormModel[0].publishSettingForm[0].publishSettingIndex)
//        publishingDateLabelColor(index: self.writeFormModel[0].publishSettingForm[0].selectedDate, isSelected: true)
    }
    
    private func setConstraints() {
        view.backgroundColor = .white.withAlphaComponent(0.9)

        NSLayoutConstraint.activate([
            publishingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            publishingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            publishingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            publishingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let openSettingLine = devidedLineViewFunc()
        publishingView.openSettingView.addSubview(openSettingLine)
        NSLayoutConstraint.activate([
            openSettingLine.leadingAnchor.constraint(equalTo: publishingView.leadingAnchor),
            openSettingLine.trailingAnchor.constraint(equalTo: publishingView.trailingAnchor),
            openSettingLine.bottomAnchor.constraint(equalTo: publishingView.openSettingView.bottomAnchor),
            openSettingLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: openSettingLine.bottomAnchor)
        ])
    }
    
    @objc func settingBackViewDidTapped(gesture: UITapGestureRecognizer) {
        let titleText = publishingView.postContentsSettingView.getPostTitle()
        let postTag = publishingView.postContentsSettingView.getPostTag()
        let categoryName = publishingView.categoryView.getCategoryNameButtonText()
        let openSettingIndex = getOpenSettingIndex()
        let publishDateIndex = getPublishDateIndex()
        let allowComment = stackView.getAllowComment()
        let passWord = getPassWordLabelText()
        delegate?.dismissSettingView(self, writeTitleText: titleText, publishTagText: postTag, categoryText: categoryName, openSettingTextIndex: openSettingIndex, publishDateIndex: publishDateIndex, allowComment: allowComment, passWordText: passWord)
    }
    
    @objc func openSettingViewDidTapped(gestrue: UITapGestureRecognizer) {
        //view -> 0, 2, 4   label -> 1, 3, 5
//        print("tapped!")
//        print(gestrue.view?.tag)
//        gestrue.view?.backgroundColor = .black
        guard let viewTag = gestrue.view?.tag, selectedIndex != (gestrue.view!.tag + 1) else { return }
        openSettingViewColor(index: selectedIndex, isSelected: false)
        openSettingViewColor(index: viewTag, isSelected: true)
        selectedIndex = viewTag
        
//        print(viewTag)
        writeFormModel[0].publishSettingForm[0].publishSettingIndex = selectedIndex
        stackView.setStackView(tag: gestrue.view!.tag)
    }
    
    @objc func categorySettingButtonDidTapped() {
        tabBarController?.tabBar.isHidden = true
        let vc = CategoryChoicePopoverViewController()
        vc.delegate = self
        vc.setWriteFormData(writeFormModel: self.writeFormModel)
        let categoryButtonText = publishingView.categoryView.getCategoryNameButtonText()
        vc.setCategoryText(text: categoryButtonText)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @objc func homeSubjectButtonDidTapped(gesture: UITapGestureRecognizer) {
        print("tapped!")
    }
    
    @objc func publishLabelDidTapped(gesture: UITapGestureRecognizer){
        guard let tag = gesture.view?.tag else { return }
        
        publishingDateLabelColor(index: selectedPublishingDateIndex, isSelected: false)
        publishingDateLabelColor(index: tag, isSelected: true)
        selectedPublishingDateIndex = tag
        writeFormModel[0].publishSettingForm[0].selectedDate = selectedPublishingDateIndex
        publishingDateReservationTab(index: tag)
    }
    
    @objc func allowCommentSwitchDidTapped(allowCommentSwitch: UISwitch) {
        if allowCommentSwitch.isOn {
            stackView.setAllowCommentSwitchData(switchValue: true)
        }
        else {
            stackView.setAllowCommentSwitchData(switchValue: false)
        }
    }
    
    @objc func postTagLabelDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        let vc = PostContentsTagSettingViewController()
        vc.delegate = self
        vc.setWriteFormModel(writeFormModel: self.writeFormModel)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setTitleText(titleText: String) {
        self.writeFormModel[0].writeTitleText = titleText
        self.writeFormModel[0].publishSettingForm[0].publishTitleText = titleText
    }
    
    func setPublishTagText(tag: String){
        self.writeFormModel[0].publishSettingForm[0].publishTagText = tag
    }
    
    func setCategoryText(category: String) {
        self.writeFormModel[0].publishSettingForm[0].publishCategoryName = category
    }
    
    func setOpenSettingIndex(index: Int) {
        self.writeFormModel[0].publishSettingForm[0].publishSettingIndex = index
    }
    
    func getOpenSettingIndex() -> Int {
        return self.writeFormModel[0].publishSettingForm[0].publishSettingIndex
    }
    
    func setPublishDateIndex(index: Int) {
        self.writeFormModel[0].publishSettingForm[0].selectedDate = index
    }
    
    func getPublishDateIndex() -> Int {
        return self.writeFormModel[0].publishSettingForm[0].selectedDate
    }
    
    func setPublishDate(date: String) {
        self.publishDate = date
    }
    
    func setAllowComment(allow: Bool) {
        self.writeFormModel[0].publishSettingForm[0].allowComment = allow
    }
    
    func setPostTagLabelText(tag: String) {
        publishingView.postContentsSettingView.postTagLabel.text = tag
    }
    
    func setPassWordLabelText(passWord: String) {
        self.writeFormModel[0].publishSettingForm[0].protectPassWord = passWord
    }
    
    func getPassWordLabelText() -> String {
        return self.writeFormModel[0].publishSettingForm[0].protectPassWord
    }
    
    
    func openSettingViewColor(index: Int, isSelected: Bool) {
        if let views = publishingView.openSettingView.subviews[index + 1] as? UIView {
            views.backgroundColor = isSelected ? .black : .lightGray
        }
        if let label = publishingView.openSettingView.subviews[index + 2] as? UILabel {
            label.textColor = isSelected ? .black : .lightGray
            label.font = .systemFont(ofSize: 14, weight: isSelected ? .bold : .light)
        }
    }
    
    func publishingDateLabelColor(index: Int, isSelected: Bool) {
        if let label = stackView.publishDateStackView.subviews[index + 1] as? UILabel {
            label.textColor = isSelected ? .black : .lightGray
            label.font = .systemFont(ofSize: 14, weight: isSelected ? .bold : .light)
        }
    }
    
    func publishingDateReservationTab(index: Int) {
        var tag = index
        if tag == 0 {
//            stackView.publishDateStackView.arrangedSubviews.last?.removeFromSuperview()
            tag = 0
            return
        }
        tag = 1
//        guard let stackViews = stackView.publishDateStackView.arrangedSubviews[tag] as? UIStackView else { return }
//        stackViews.addArrangedSubview(stackView.publishDateStackView.publishDateView)
//        stackView.publishDateStackView.publishDateView.setPublishDate(date: writeFormModel[0].publishSettingForm[0].publishDate)
//        stackView.publishDateStackView.publishDateView.setPublishHour(hour: writeFormModel[0].publishSettingForm[0].publishHour)
//
//        NSLayoutConstraint.activate([
//            stackView.publishDateStackView.publishDateView.widthAnchor.constraint(equalTo: stackView.publishDateStackView.widthAnchor),
//            stackView.publishDateStackView.publishDateView.heightAnchor.constraint(equalToConstant: 50)
//        ])
    }
    
}
