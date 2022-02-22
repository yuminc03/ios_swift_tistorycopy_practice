//
//  AnnouncementTableViewHeader.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/22.
//

import UIKit

class AnnouncementTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var dismissAnnouncementTableViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
    } ()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "공지사항"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dismissAnnouncementTableViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissAnnouncementTableViewButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dismissAnnouncementTableViewButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerTitle.topAnchor.constraint(equalTo: dismissAnnouncementTableViewButton.bottomAnchor, constant: 25)
        ])
    }
}
