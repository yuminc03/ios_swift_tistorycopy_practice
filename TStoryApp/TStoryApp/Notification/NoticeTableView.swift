//
//  FeedTableView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/28.
//

import UIKit

class FeedTableView: UITableView {
    
    var noticeModel: [NoticeModel] = []
    var selectedCategoryIndex: Int = 0
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        
        separatorStyle = .none
//        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundColor = .clear
        register(FeedTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "feed_header")
        register(FeedTableViewCell.self, forCellReuseIdentifier: "feed_cell")
        register(NoticeIsNullTableViewCell.self, forCellReuseIdentifier: "feed_null_cell")
        
        showsVerticalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
