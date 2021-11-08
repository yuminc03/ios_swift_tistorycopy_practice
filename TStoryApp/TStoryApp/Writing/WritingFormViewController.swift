//
//  WritingFormViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/29.
//

import UIKit

//protocol WritingFormViewontrollerDelegate: AnyObject {
//
//}
class WritingFormViewController: UIViewController {
    
    var writeFormModel = WriteFormModel()
    var titleText: String = ""
    var sortingLabel: String = "왼쪽 정렬"
    var sortingIndex: Int = 0
    
    var selectedPublishingDateIndex: Int = 0
    var allowComment: Bool = true
    
    lazy var writingFormView: WritingFormView = {
        let writeView = WritingFormView()
        writeView.translatesAutoresizingMaskIntoConstraints = false
        writeView.backgroundColor = .white
        writeView.setWriteFormData(writeFormModel: [writeFormModel])
        writeView.setTitleTextPlace(titleTextPlaceHolder: writeFormModel.writeTitleText)
        writeView.setContentsTextPlace(contentsTextPlaceHolder: writeFormModel.writeContentText)
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
        writeHeaderView.isUserInteractionEnabled = true
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
//            vc.setWriteFormData(writeFormModel: [writeFormModel])
//            vc.delegate = self
//            let titleText = writingFormView.getTitleText()
//            vc.setTitleText(titleText: titleText)

//            let categoryText = writeFormModel.publishSettingForm[0].publishCategoryName
//            vc.setCategoryText(category: categoryText)
//            let openSettingIndex = writeFormModel.publishSettingForm[0].publishSettingIndex
//            vc.setOpenSettingIndex(index: openSettingIndex)
//            let homeSubjectText = writeFormModel.publishSettingForm[0].publishSubject
//            let publishDateIndex = writeFormModel.publishSettingForm[0].selectedDate
//            vc.setPublishDateIndex(index: publishDateIndex)
//            let publishDate = writeFormModel.publishSettingForm[0].publishDate
//            vc.setPublishDate(date: publishDate)
//            let allowComments = writeFormModel.publishSettingForm[0].allowComment
//            vc.setAllowComment(allow: allowComment)
//            let passWord = writeFormModel.publishSettingForm[0].protectPassWord
            vc.setPublishSettingFormModel(publishSettingFormModel: writeFormModel.publishSettingForm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func formDismissViewDidTapped(gesture: UITapGestureRecognizer) {
        print("tapped!")
    }
    @objc func changeSortLabelDidTapped(gesture: UITapGestureRecognizer) {
        print("tapped!")
        
    }
    
//    func setSorting() -> Int {
//        let sortLabelArr: [String] = ["왼쪽 정렬", "가운데 정렬", "오른쪽 정렬", "정렬 없음"]
//
//        if sorting < 3 {
//            sorting = sorting + 1
//            if sorting == 0 {
//                writingFormView.contentsTextView.textAlignment = .left
//                sortingLabel = sortLabelArr[0]
//            }
//            else if sorting == 1 {
//                writingFormView.contentsTextView.textAlignment = .right
//                sortingLabel = sortLabelArr[1]
//            }
//            else if sorting == 2 {
//                writingFormView.contentsTextView.textAlignment = .center
//                sortingLabel = sortLabelArr[2]
//            }
//            else {
//                return
//            }
//        }
//        else {
//            sorting = 0
//            writingFormView.contentsTextView.textAlignment = .natural
//            sortingLabel = sortLabelArr[3]
//        }
//    }
    
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
    
    func setPublishTagText(tag: String){
        self.writeFormModel.publishSettingForm[0].publishTagText = tag
    }
    
    func setCategoryText(category: String) {
        self.writeFormModel.publishSettingForm[0].publishCategoryName = category
    }
    
    func setOpenSettingIndex(index: Int) {
        self.writeFormModel.publishSettingForm[0].publishSettingIndex = index
    }

    func setPublishDateIndex(index: Int) {
        self.selectedPublishingDateIndex = index
        self.writeFormModel.publishSettingForm[0].selectedDate = self.selectedPublishingDateIndex
    }
    
    func setAllowComment(allow: Bool) {
        self.allowComment = allow
        self.writeFormModel.publishSettingForm[0].allowComment = self.allowComment
    }
    
    func setPassWordLabel(passWord: String) {
        self.writeFormModel.publishSettingForm[0].protectPassWord = passWord
    }
    
}

