//
//  ProfileView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

class ProfileView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped) //header도 함께 사라지도록!
        
        separatorStyle = .none
        backgroundColor = .clear
        estimatedSectionHeaderHeight = 500
        register(ProfileTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "profile_header")
        register(MyContentTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "my_content_header")
        register(MyContentTableViewCell.self, forCellReuseIdentifier: "my_contents")
        
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
