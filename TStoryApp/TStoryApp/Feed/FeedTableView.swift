//
//  FeedTableView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/10.
//

import UIKit

class FeedTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        separatorStyle = .none
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
