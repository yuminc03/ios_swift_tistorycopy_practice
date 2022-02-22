//
//  NoticeIsNullTableViewCell.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/29.
//

import UIKit

class NoticeIsNullTableViewCell: UITableViewCell {
    
    //row가 한 개도 없다면 '알림 항목이 없습니다.' 띄우기
    //row의 count == 0 이면
    //cell을 다른것으로 바꾸어 준다. 조건에 따라 다른 cell을 보여주는 것이다.
    //identifier를 다르게 해서 호출한다.
    
    lazy var noticeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "알림 항목이 없습니다."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        addSubview(label)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            noticeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            noticeLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            noticeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            noticeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
