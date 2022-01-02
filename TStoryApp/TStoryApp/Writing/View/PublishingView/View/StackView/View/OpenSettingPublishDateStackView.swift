//
//  OpenSettingPublishDateView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/04.
//

import UIKit

class OpenSettingPublishDateStackView: UIView {
    
    var writeFormModel : [WriteFormModel] = []
    
    lazy var publishDateTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "발행일"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        self.addSubview(publishDateTitle)
        return label
    }()
    
    lazy var publishCurrentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "현재"
        label.tag = 0
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.isUserInteractionEnabled = true
        self.addSubview(publishCurrentLabel)
        return label
    }()
    
    lazy var publishDividedView: UIView = {
        let dividedView = UIView()
        dividedView.translatesAutoresizingMaskIntoConstraints = false
        dividedView.backgroundColor = .lightGray
        self.addSubview(publishDividedView)
        return dividedView
    }()
    
    lazy var publishReservationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "예약"
        label.tag = 1
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        self.addSubview(publishReservationLabel)
        return label
    }()
    
//    lazy var publishDateView: OpenSettingPublishDateView = {
//        let publishDateView = OpenSettingPublishDateView()
//        publishDateView.translatesAutoresizingMaskIntoConstraints = false
//        publishDateView.backgroundColor = .white
//        return publishDateView
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            publishDateTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            publishDateTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            publishCurrentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            publishCurrentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            publishDividedView.widthAnchor.constraint(equalToConstant: 1),
            publishDividedView.heightAnchor.constraint(equalToConstant: 12),
            publishDividedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            publishDividedView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            publishReservationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            publishReservationLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setWriteFormModel(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setPublishDateIndex(index: Int) {
        self.writeFormModel[0].publishSettingForm[0].selectedDate = index
    }
    
}
