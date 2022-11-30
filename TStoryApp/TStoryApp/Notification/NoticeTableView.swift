//
//  FeedTableView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/28.
//

import UIKit

class NoticeTableView: UITableView {
    
    var noticeModel: [NoticeModel] = []
    var selectedCategoryIndex: Int = 0
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        
        separatorStyle = .none
//        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundColor = .clear
        register(NoticeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "feed_header")
        register(NoticeTableViewCell.self, forCellReuseIdentifier: "feed_cell")
        register(NoticeIsNullTableViewCell.self, forCellReuseIdentifier: "feed_null_cell")
        
        showsVerticalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
