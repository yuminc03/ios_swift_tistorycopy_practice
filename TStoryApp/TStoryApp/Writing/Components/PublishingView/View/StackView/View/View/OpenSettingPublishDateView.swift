//
//  OpenSettingPublishDateView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/05.
//

import UIKit

class OpenSettingPublishDateView: UIView {
    
    var writeFormModel : [WriteFormModel] = []
    
    lazy var publishReservationDateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.titleLabel?.textColor = .black
        return button
    }()
    
    lazy var publishReservationHourButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.titleLabel?.textColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            publishReservationDateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            publishReservationDateButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            publishReservationDateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            publishReservationHourButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            publishReservationHourButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            publishReservationHourButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
//        let line = devidedLineViewFunc()
//        self.addSubview(line)
//        NSLayoutConstraint.activate([
//            line.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            line.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            line.heightAnchor.constraint(equalToConstant: 0.5)
//        ])
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setPublishDate(date: String) {
        self.writeFormModel[0].publishSettingForm[0].publishDate = date
        publishReservationDateButton.titleLabel?.text = date
    }
    
    func setPublishHour(hour: String) {
        self.writeFormModel[0].publishSettingForm[0].publishHour = hour
        publishReservationHourButton.titleLabel?.text = hour
    }
}
