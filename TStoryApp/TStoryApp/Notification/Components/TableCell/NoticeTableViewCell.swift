//
//  FeedTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/28.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {
    
    lazy var commentWritedProfileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        addSubview(view)
        return view
    }()
    
    lazy var commentNoticeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .thin)
        label.textColor = .black
        label.numberOfLines = 2
        addSubview(label)
        return label
    }()
    
    lazy var commentContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .thin)
        label.textColor = .black
        label.numberOfLines = 2
        addSubview(label)
        return label
    }()
    
    lazy var commentWritedPersonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .thin)
        label.textColor = .lightGray
        addSubview(label)
        return label
    }()
    
    lazy var commentWritedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .thin)
        label.textColor = .lightGray
        addSubview(label)
        return label
    }()
    
    lazy var cellDividedLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(view)
        return view
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
            commentWritedProfileView.widthAnchor.constraint(equalToConstant: 36),
            commentWritedProfileView.heightAnchor.constraint(equalToConstant: 36),
            commentWritedProfileView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            commentWritedProfileView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            commentNoticeLabel.leadingAnchor.constraint(equalTo: commentWritedProfileView.trailingAnchor, constant: 14),
            commentNoticeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            commentNoticeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            commentContentLabel.leadingAnchor.constraint(equalTo: commentWritedProfileView.trailingAnchor, constant: 14),
            commentContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            commentContentLabel.topAnchor.constraint(equalTo: commentNoticeLabel.bottomAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            commentWritedPersonLabel.leadingAnchor.constraint(equalTo: commentWritedProfileView.trailingAnchor, constant: 14),
            commentWritedPersonLabel.topAnchor.constraint(equalTo: commentContentLabel.bottomAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            commentWritedDateLabel.leadingAnchor.constraint(equalTo: commentWritedPersonLabel.trailingAnchor, constant: 14),
            commentWritedDateLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            //lessThanOrEqualTo : <=(이하) 라는 뜻, leading이 우선순위가 더 높고 결국 왼쪽으로 붙게 된다
            commentWritedDateLabel.topAnchor.constraint(equalTo: commentContentLabel.bottomAnchor, constant: 14),
            commentWritedDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            cellDividedLine.heightAnchor.constraint(equalToConstant: 0.5),
            cellDividedLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellDividedLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellDividedLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setProfileViewColorFunc(index: Int) {
        commentWritedProfileView.backgroundColor = .blue.withAlphaComponent(CGFloat(index + 1) * 0.25)
    }
    
    func setProfileViewCellData(title: String, contents: String, noticeSender: String, noticeDate: String) {
        commentNoticeLabel.text = title
        commentContentLabel.text = contents
        commentWritedPersonLabel.text = noticeSender
        commentWritedDateLabel.text = noticeDate
        
    }
}
