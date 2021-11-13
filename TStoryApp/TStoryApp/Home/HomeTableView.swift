//
//  HomeTableView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class HomeTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        backgroundColor = .clear
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        register(TopHeaderView.self, forHeaderFooterViewReuseIdentifier: "top_header")
        register(VisitTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "visit_header")
        register(VisitTableViewCell.self, forCellReuseIdentifier: "visit_cell")
        register(RecentlyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "recently_header")
        register(RecentlyTableViewCell.self, forCellReuseIdentifier: "recently_cell")
        register(PopularityTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "popularity_header")
        register(PopularityTableViewCell.self, forCellReuseIdentifier: "popularity_cell")
        register(SubscriberTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "subscriber_header")
        register(SubscriberTableViewCell.self, forCellReuseIdentifier: "subscriber_cell")
        register(SubscriberTableViewFooter.self, forHeaderFooterViewReuseIdentifier: "subscriber_footer")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
