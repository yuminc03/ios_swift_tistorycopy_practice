//
//  MyBlogOfProfileView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/17.
//

import UIKit

class MyBlogOfProfileView: UIView {
    
    lazy var myBlogOfProfileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProfileInfoTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "profile_info_table_header")
        tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: "profile_info_table_cell")
        addSubview(tableView)
        return tableView
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
            myBlogOfProfileTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myBlogOfProfileTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myBlogOfProfileTableView.topAnchor.constraint(equalTo: topAnchor, constant: 400),
            myBlogOfProfileTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
