//
//  VisitNumGraphCollectionViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

class VisitNumGraphCollectionViewCell: UICollectionViewCell {
    
    var visitNumWeek: [VisitNumberWeek] = []
    
    lazy var visitGraphView: VisitGraphView = {
        let visitView = VisitGraphView()
        visitView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(visitView)
        return visitView
    } ()
    
    lazy var todayVisitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "오늘 방문수"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var todayVisitNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    lazy var todayVisitNumIncrement: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var currentTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = setCurrentTime() + " 기준"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        addSubview(label)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            visitGraphView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            visitGraphView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            todayVisitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            todayVisitLabel.topAnchor.constraint(equalTo: visitGraphView.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            todayVisitNumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            todayVisitNumLabel.topAnchor.constraint(equalTo: todayVisitLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            todayVisitNumIncrement.leadingAnchor.constraint(equalTo: todayVisitNumLabel.trailingAnchor, constant: 5),
            todayVisitNumIncrement.topAnchor.constraint(equalTo: todayVisitLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            currentTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currentTime.topAnchor.constraint(equalTo: visitGraphView.bottomAnchor, constant: 5)
        ])
    }
    
    func setCellStyle() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.borderWidth = 0.1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 4
    }

    func setVisitNumberComponents() {
        let visitNumWeekLen = self.visitNumWeek.count
        let visitNumberWeekLastNum = visitNumWeek[visitNumWeekLen - 1].todayVisitCount
        let visitNumberWeekSecondLast = visitNumWeek[visitNumWeekLen - 2].todayVisitCount
        let visitNumberIncrement = abs(visitNumberWeekLastNum - visitNumberWeekSecondLast)
        todayVisitNumIncrement.textColor = visitNumberWeekLastNum >= visitNumberWeekSecondLast ? .systemRed : .systemBlue
        todayVisitNumIncrement.text = visitNumberWeekLastNum >= visitNumberWeekSecondLast ? "▲ \(visitNumberIncrement)" : "▼ \(visitNumberIncrement)"
        todayVisitNumLabel.text = "\(visitNumberWeekLastNum)"
    }
    
    func setVisitNumWeek(model: [VisitNumberWeek]){
        self.visitNumWeek = model
    }

    func setCurrentTime() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM. dd. HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    
}

