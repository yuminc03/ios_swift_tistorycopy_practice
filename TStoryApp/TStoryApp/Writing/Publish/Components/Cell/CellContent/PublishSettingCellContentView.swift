//
//  PublishingSettingCellContentView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/05.
//

import UIKit

protocol PublishSettingCellContentViewDelegate: AnyObject {
//    func extendableButtonToggle()
    func currentDateLabelDidTapped()
    func reservationDateLabelDidTapped()
}

class PublishSettingCellContentView: UIView {
    
    var homeSubject: String = ""
    var publishDateIndex: Int = 0
    var publishDate: String = ""
    var publishHour: String = ""
    var commentAllow: Bool = true
    var password: String = ""
    
    weak var delegate: PublishSettingCellContentViewDelegate?
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        return stackView
    } ()
    
    lazy var homeSubjectView: HomeSubjectView = {
        let homeSubjectView = HomeSubjectView()
        homeSubjectView.translatesAutoresizingMaskIntoConstraints = false
        homeSubjectView.backgroundColor = .white
        homeSubjectView.setHomeSubject(subjectText: homeSubject)
        return homeSubjectView
    } ()
    
    lazy var passwordView: PasswordSettingView = {
        let passwordView = PasswordSettingView()
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.backgroundColor = .white
        passwordView.setPassword(text: password)
        return passwordView
    } ()
    
    lazy var publishDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    } ()
    
    lazy var publishCurrentDateView: PublishCurrentDateView = {
        let currentView = PublishCurrentDateView()
        currentView.translatesAutoresizingMaskIntoConstraints = false
        currentView.backgroundColor = .white
        currentView.setPublishDateIndex(index: publishDateIndex)
        currentView.publishCurrentDateLabel.isUserInteractionEnabled = true
        let currentGesture = UITapGestureRecognizer(target: self, action: #selector(currentLabelDidTapped))
        currentView.publishCurrentDateLabel.addGestureRecognizer(currentGesture)
        currentView.publishReservationDateLabel.isUserInteractionEnabled = true
        let reservationGesture = UITapGestureRecognizer(target: self, action: #selector(reservationGestureDidTapped))
        currentView.publishReservationDateLabel.addGestureRecognizer(reservationGesture)
        return currentView
    } ()
    
    lazy var publishReservationDateView: PublishReservationDateView = {
        let reservationView = PublishReservationDateView()
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        reservationView.backgroundColor = .white
        reservationView.setPublishDate(date: setDate())
        reservationView.setPublishHour(hour: setHour())
        return reservationView
    } ()
    
    lazy var commentAllowView: CommentAllowView = {
        let commentView = CommentAllowView()
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.backgroundColor = .white
        commentView.setCommentAllow(allow: commentAllow)
        return commentView
    } ()

    
//    lazy var homeView: UIStackView = {
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .vertical
//        return view
//    } ()
//
//    var dateView: UIView = UIView()
//
//    var commentView: UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
//        publishingDateLabelColor(index: publishDateIndex, isSelected: true)
        publishDateIndex == 0 ? currentLabelClicked() : reservationLabelClicked()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(index: Int, data: String, hasAdditionalDate: Bool) {
        
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        for subview in publishDateStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        switch index {
        case 0:
            stackView.addArrangedSubview(homeSubjectView)
            homeSubjectView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            homeSubjectView.setHomeSubject(subjectText: data)
            stackView.addArrangedSubview(publishDateStackView)
            publishDateStackView.addArrangedSubview(publishCurrentDateView)
            publishCurrentDateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            publishCurrentDateView.setUI(isSelected: hasAdditionalDate)
            publishDateIndex == 0 ? currentLabelClicked() : reservationLabelClicked()
            if hasAdditionalDate {
                publishDateStackView.addArrangedSubview(publishReservationDateView)
                publishReservationDateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            }
            stackView.addArrangedSubview(commentAllowView)
            commentAllowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        case 1:
            stackView.addArrangedSubview(passwordView)
            passwordView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(publishDateStackView)
            publishDateStackView.addArrangedSubview(publishCurrentDateView)
            publishCurrentDateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            publishDateIndex == 0 ? currentLabelClicked() : reservationLabelClicked()
            if hasAdditionalDate {
                publishDateStackView.addArrangedSubview(publishReservationDateView)
                publishReservationDateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            }
            stackView.addArrangedSubview(commentAllowView)
            commentAllowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        case 2:
            stackView.addArrangedSubview(commentAllowView)
            commentAllowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        default: return
        }
        
//        let view1 = UIView()
//        view1.translatesAutoresizingMaskIntoConstraints = false
//        view1.backgroundColor = .gray
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(extendableViewDidTapped))
//        view1.addGestureRecognizer(gesture)
//        let view2 = UIView()
//        view2.translatesAutoresizingMaskIntoConstraints = false
//        view2.backgroundColor = .cyan
//
//        switch index {
//        case 0:
//            stackView.addArrangedSubview(homeSubjectView)
//            homeSubjectView.addArrangedSubview(view1)
//            view1.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            if hasAdditionalHome {
//                homeSubjectView.addArrangedSubview(view2)
//                view2.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            }
//            dateView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(dateView)
//            dateView.backgroundColor = .blue
//            dateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            commentView.translatesAutoresizingMaskIntoConstraints = false
//            commentView.backgroundColor = .brown
//            stackView.addArrangedSubview(commentView)
//            commentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        case 1:
//            homeView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(homeSubjectView)
//            dateView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(dateView)
//            dateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            commentView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(commentView)
//            commentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        case 2:
//            commentView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(commentView)
//        default: return
//        }
        
    }
    
//    @objc private func extendableViewDidTapped() {
//        delegate?.extendableButtonToggle()
//    }
    
    @objc private func currentLabelDidTapped(gesture: UITapGestureRecognizer) {
        delegate?.currentDateLabelDidTapped()
        guard let tag = gesture.view?.tag else { return }
//        publishingDateLabelColor(index: publishDateIndex, isSelected: false)
//        publishingDateLabelColor(index: tag, isSelected: true)
        setPublishDateIndex(index: tag)
        currentLabelClicked()
    }
    
    @objc private func reservationGestureDidTapped(gesture: UITapGestureRecognizer) {
        delegate?.reservationDateLabelDidTapped()
        guard let tag = gesture.view?.tag else { return }
//        publishingDateLabelColor(index: publishDateIndex, isSelected: false)
//        publishingDateLabelColor(index: tag, isSelected: true)
        setPublishDateIndex(index: tag)
        reservationLabelClicked()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setHomeSubject(name: String) {
        self.homeSubject = name
    }
    
    func setPublishDateIndex(index: Int) {
        self.publishDateIndex = index
    }
    
    func getPublishDateIndex() -> Int {
        return publishDateIndex
    }
    
    func setPublishDate(date: String) {
        self.publishDate = date
    }
    
    func setPublishHour(hour: String) {
        self.publishHour = hour
    }
    
    func setCommentAllow(allow: Bool) {
        self.commentAllow = allow
    }
    
    func setPassword(text: String) {
        self.password = text
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
    
    func currentLabelClicked() {
        publishCurrentDateView.publishCurrentDateLabel.textColor = .black
        publishCurrentDateView.publishCurrentDateLabel.font = .systemFont(ofSize: 14, weight: .bold)
        publishCurrentDateView.publishReservationDateLabel.textColor = .lightGray
        publishCurrentDateView.publishReservationDateLabel.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    func reservationLabelClicked() {
        publishCurrentDateView.publishCurrentDateLabel.textColor = .lightGray
        publishCurrentDateView.publishCurrentDateLabel.font = .systemFont(ofSize: 14, weight: .light)
        publishCurrentDateView.publishReservationDateLabel.textColor = .black
        publishCurrentDateView.publishReservationDateLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }

    
}
