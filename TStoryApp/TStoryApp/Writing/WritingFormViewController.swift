//
//  WritingFormViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/29.
//

import UIKit

//protocol WritingFormViewontrollerDelegate: AnyObject {
//
//}
class WritingFormViewController: UIViewController {
    
    var writeFormModel = WriteFormModel()
    let titleTextPlaceHolder: String = "제목"
    let contentsTextPlaceHolder: String = "내용을 입력해주세요."
    var titleText: String = ""
    var publishSettingIndex: Int = 0
    var publishDateIndex: Int = 0
    var sortingLabel: String = "왼쪽 정렬"
    var sortingIndex: Int = 0
    var allowComment: Bool = true
    
    lazy var writingFormView: WritingFormView = {
        let writeView = WritingFormView()
        writeView.translatesAutoresizingMaskIntoConstraints = false
        writeView.backgroundColor = .white
        writeView.setWriteFormData(writeFormModel: [writeFormModel])
        writeView.setTitleTextPlace(titleTextPlaceHolder: titleTextPlaceHolder)
        writeView.setContentsTextPlace(contentsTextPlaceHolder: contentsTextPlaceHolder)
        writeView.setTitleText(titleText: writeView.titleTextView.text)
        titleText = writeView.getTitleText()
        
        let sortGesture = UITapGestureRecognizer(target: self, action: #selector(changeSortLabelDidTapped))
        writeView.changeSortLabel.addGestureRecognizer(sortGesture)
        writeView.changeSortLabel.isUserInteractionEnabled = true
        writeView.setSortingLabel(text: sortingLabel)
        view.addSubview(writeView)
        return writeView
    }()
    
    lazy var writingFormHeaderView: WritingFormHeaderView = {
        let writeHeaderView = WritingFormHeaderView()
        writeHeaderView.translatesAutoresizingMaskIntoConstraints = false
        writeHeaderView.backgroundColor = .white
        let writeFormBackGesture = UITapGestureRecognizer(target: self, action: #selector(formDismissViewDidTapped))
        writeHeaderView.formDismissLabel.addGestureRecognizer(writeFormBackGesture)
        writeHeaderView.setFormSaveNum(formSaveNum: writeFormModel.formSaveNum)
        writeHeaderView.formCompletionButton.addTarget(self, action: #selector(formCompletionButtonDidTapped), for: .touchUpInside)
        writingFormView.addSubview(writeHeaderView)
        return writeHeaderView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configulation()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isTranslucent = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func configulation() {
        
        let model = WriteFormModel(
            writeTitleText: "제목",
            writeContentText: "내용을 입력해주세요.",
            formSaveNum: 0,
            formSorting: 0,
            publishSettingForm: [
                PublishSettingFormModel(
                    publishTitleText: "",
                    publishTagText: "#태그입력",
                    publishCategoryName: "선택 안 함",
                    publishSettingIndex: 0,
                    publishSubject: "선택 안 함",
                    selectedDate: 0,
                    publishDate: setDate(),
                    publishHour: setHour(),
                    allowComment: true,
                    protectPassWord: "MjBiYzli"
                )
            ]
        )
        
        writeFormModel = model
    }
    
    func setConstraints() {
        
        view.backgroundColor = .white.withAlphaComponent(0.9)
        
        NSLayoutConstraint.activate([
            writingFormView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            writingFormView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            writingFormView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            writingFormView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            writingFormHeaderView.leadingAnchor.constraint(equalTo: writingFormView.leadingAnchor),
            writingFormHeaderView.trailingAnchor.constraint(equalTo: writingFormView.trailingAnchor),
            writingFormHeaderView.topAnchor.constraint(equalTo: writingFormView.topAnchor),
            writingFormHeaderView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    @objc func formCompletionButtonDidTapped(button: UIButton) {
        if writingFormView.titleTextView.text.isEmpty || writingFormView.titleTextView.textColor == .lightGray.withAlphaComponent(0.8) {
            print("제목을 입력하세요...")
        }
        else {
            let vc = PublishSettingViewController()
            vc.setWriteFormModel(writeFormModel: writeFormModel)
            vc.delegate = self
            let titleText = writingFormView.getTitleText()
            vc.setWriteTitle(title: titleText)
            let homeSubject = getHomeSubject()
            vc.setHomeSubject(name: homeSubject)
            let publishSettingIndex = getOpenSettingIndex()
            vc.setPublishSettingIndex(index: publishSettingIndex)
            let publishDateIndex = getPublishDateIndex()
            vc.setPublishDateIndex(index: publishDateIndex)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func formDismissViewDidTapped(gesture: UITapGestureRecognizer) {
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = (tabBarController as? TabBarViewController)?.lastTabBarIndex ?? 0
        (tabBarController as? TabBarViewController)?.lastTabBarIndex = self.tabBarController?.selectedIndex
        
    }
    @objc func changeSortLabelDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        let sortingLabelArr: [String] = ["왼쪽 정렬", "가운데 정렬", "오른쪽 정렬", "정렬 없음"]
        sortingIndex = setSorting(index: sortingIndex)
        if sortingIndex == 0 {
            writingFormView.contentsTextAlignLeft()
            writingFormView.setSortingLabel(text: sortingLabelArr[0])
        }
        else if sortingIndex == 1 {
            writingFormView.contentsTextAlignCenter()
            writingFormView.setSortingLabel(text: sortingLabelArr[1])
        }
        else if sortingIndex == 2 {
            writingFormView.contentsTextAlignRight()
            writingFormView.setSortingLabel(text: sortingLabelArr[2])
        }
        else if sortingIndex == 3 {
            writingFormView.contentsTextAlignNone()
            writingFormView.setSortingLabel(text: sortingLabelArr[3])
        }
        else {
            return
        }
    }
    
    func setSorting(index: Int) -> Int {
        var num = index
        if index < 3 {
            num += 1
            return num
        }
        else if index == 3 {
            return 0
        }
        else {
            return 0
        }
    }
    
    func setDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd."
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    
    func setHour() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    
    func setSortingIndex(index: Int) {
        self.sortingIndex = index
        self.writeFormModel.formSorting = index
    }
    
    func setPublishTagText(tag: String){
        self.writeFormModel.publishSettingForm[0].publishTagText = tag
    }
    
    func setCategoryText(category: String) {
        self.writeFormModel.publishSettingForm[0].publishCategoryName = category
    }
    
    func setOpenSettingIndex(index: Int) {
        self.publishSettingIndex = index
        self.writeFormModel.publishSettingForm[0].publishSettingIndex = index
    }
    
    func getOpenSettingIndex() -> Int {
        return writeFormModel.publishSettingForm[0].publishSettingIndex
    }
    
    func setHomeSubject(name: String) {
        self.writeFormModel.publishSettingForm[0].publishSubject = name
    }
    
    func getHomeSubject() -> String {
        return self.writeFormModel.publishSettingForm[0].publishSubject
    }

    func setPublishDateIndex(index: Int) {
        self.publishDateIndex = index
        self.writeFormModel.publishSettingForm[0].selectedDate = index
    }
    
    func getPublishDateIndex() -> Int {
        return writeFormModel.publishSettingForm[0].selectedDate
    }
    
    func setAllowComment(allow: Bool) {
        self.allowComment = allow
        self.writeFormModel.publishSettingForm[0].allowComment = self.allowComment
    }
    
    func setPassWordLabel(passWord: String) {
        self.writeFormModel.publishSettingForm[0].protectPassWord = passWord
    }
    
}

