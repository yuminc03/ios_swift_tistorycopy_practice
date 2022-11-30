//
//  WritingFormView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/29.
//

import UIKit

class WritingFormView: UIView {
    
    var titleTextPlaceHolder: String = ""
    var contentsTextPlaceHolder: String = ""
    var writeFormModel: [WriteFormModel] = []
    var titleText: String = ""
    var contentText: String = ""
    var sortingLabel: String = ""
    
    lazy var titleTextView: UITextView = {
        let titleTestView = UITextView()
        titleTestView.translatesAutoresizingMaskIntoConstraints = false
        titleTestView.font = .systemFont(ofSize: 25)
        //view.text = titleTextPlaceHolder
        titleTestView.textColor = .lightGray.withAlphaComponent(0.8)
        titleTestView.textContainer.lineBreakMode = .byCharWrapping
        titleTestView.isScrollEnabled = false
        titleTestView.delegate = self
        addSubview(titleTestView)
        return titleTestView
    }()
    
    lazy var contentsTextView: UITextView = {
        let contentsTextView = UITextView()
        contentsTextView.translatesAutoresizingMaskIntoConstraints = false
        contentsTextView.font = .systemFont(ofSize: 16)
        //view.text = contentsTextPlaceHolder
        contentsTextView.textColor = .lightGray.withAlphaComponent(0.8)
        contentsTextView.textContainer.lineBreakMode = .byCharWrapping
        contentsTextView.delegate = self
        addSubview(contentsTextView)
        return contentsTextView
    }()
    
    lazy var plusContentsView: UIView = {
        let contentsView = UIView()
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        contentsView.backgroundColor = .black.withAlphaComponent(0.3)
        contentsView.layer.cornerRadius = 5
        addSubview(contentsView)
        return contentsView
    }()
    
    lazy var plusImagesView: UIView = {
        let imagesView = UIView()
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        imagesView.backgroundColor = .black.withAlphaComponent(0.4)
        imagesView.layer.cornerRadius = 5
        addSubview(imagesView)
        return imagesView
    }()
    
    lazy var plusVideosView: UIView = {
        let videosView = UIView()
        videosView.translatesAutoresizingMaskIntoConstraints = false
        videosView.backgroundColor = .black.withAlphaComponent(0.5)
        videosView.layer.cornerRadius = 10
        addSubview(videosView)
        return videosView
    }()
    
    lazy var plusEmojisView: UIView = {
        let emojisView = UIView()
        emojisView.translatesAutoresizingMaskIntoConstraints = false
        emojisView.backgroundColor = .black.withAlphaComponent(0.6)
        emojisView.layer.cornerRadius = 10
        addSubview(emojisView)
        return emojisView
    }()
    
    lazy var changeFontsView: UIView = {
        let changeFontsView = UIView()
        changeFontsView.translatesAutoresizingMaskIntoConstraints = false
        changeFontsView.backgroundColor = .black.withAlphaComponent(0.7)
        changeFontsView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        changeFontsView.layer.cornerRadius = 10
        addSubview(changeFontsView)
        return changeFontsView
    }()
    
    lazy var changeSortLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "왼쪽 정렬"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleTextView.topAnchor.constraint(equalTo: topAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            contentsTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentsTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentsTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 25),
            contentsTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            plusContentsView.widthAnchor.constraint(equalToConstant: 20),
            plusContentsView.heightAnchor.constraint(equalToConstant: 20),
            plusContentsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            plusContentsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            plusImagesView.widthAnchor.constraint(equalToConstant: 20),
            plusImagesView.heightAnchor.constraint(equalToConstant: 20),
            plusImagesView.leadingAnchor.constraint(equalTo: plusContentsView.trailingAnchor, constant: 20),
            plusImagesView.centerYAnchor.constraint(equalTo: plusContentsView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plusVideosView.widthAnchor.constraint(equalToConstant: 20),
            plusVideosView.heightAnchor.constraint(equalToConstant: 20),
            plusVideosView.leadingAnchor.constraint(equalTo: plusImagesView.trailingAnchor, constant: 20),
            plusVideosView.centerYAnchor.constraint(equalTo: plusImagesView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plusEmojisView.widthAnchor.constraint(equalToConstant: 20),
            plusEmojisView.heightAnchor.constraint(equalToConstant: 20),
            plusEmojisView.leadingAnchor.constraint(equalTo: plusVideosView.trailingAnchor, constant: 20),
            plusEmojisView.centerYAnchor.constraint(equalTo: plusVideosView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeFontsView.widthAnchor.constraint(equalToConstant: 20),
            changeFontsView.heightAnchor.constraint(equalToConstant: 20),
            changeFontsView.leadingAnchor.constraint(equalTo: plusEmojisView.trailingAnchor, constant: 20),
            changeFontsView.centerYAnchor.constraint(equalTo: plusEmojisView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeSortLabel.leadingAnchor.constraint(equalTo: changeFontsView.trailingAnchor, constant: 20),
            changeSortLabel.centerYAnchor.constraint(equalTo: changeFontsView.centerYAnchor)
        ])
        
    }
    
    func setTitleTextPlace(titleTextPlaceHolder: String) {
        self.titleTextPlaceHolder = titleTextPlaceHolder
        titleTextView.text = self.titleTextPlaceHolder
    }
    
    func setContentsTextPlace(contentsTextPlaceHolder: String) {
        self.contentsTextPlaceHolder = contentsTextPlaceHolder
        contentsTextView.text = self.contentsTextPlaceHolder
    }

    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setTitleText(titleText: String) {
//        self.titleText = titleText
        writeFormModel[0].writeTitleText = titleText
        writeFormModel[0].publishSettingForm[0].publishTitleText = titleText
    }

    func getTitleText() -> String {
        return titleTextView.text
    }
    
    func setTitleTextViewText(titleText: String) {
        titleTextView.text = titleText
    }
    
    func getContentViewText() -> String {
        return contentsTextView.text
    }
    
    func setSortingLabel(text: String) {
        self.sortingLabel = text
        changeSortLabel.text = sortingLabel
    }
    
    func contentsTextAlignLeft() {
        contentsTextView.textAlignment = .left
    }
    
    func contentsTextAlignCenter() {
        contentsTextView.textAlignment = .center
    }
    
    func contentsTextAlignRight() {
        contentsTextView.textAlignment = .right
    }
    
    func contentsTextAlignNone() {
        contentsTextView.textAlignment = .natural
    }
    
}
