//
//  FeedModel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

struct NoticeModel {
    var noticeCategory: [NoticeCategory] = []
}

struct NoticeCategory {
    var categoryName: String = ""
    var isSelected: Bool = false
    var noticeCell : [NoticeCell] = []
}

struct NoticeCell {
    var cellTitle: String = ""
    var cellImage: String?
    var cellContent: String = ""
    var cellFeedSender: String = ""
    var cellFeedDate: String = ""
}
