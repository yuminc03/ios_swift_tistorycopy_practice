//
//  FeedDataModel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/10.
//

struct FeedModel {
    var subscribingNum: Int = 0
    var subscriberNum: Int = 0
    var feedCell: [FeedCell] = []
}

struct FeedCell {
    var feedTitle: String = ""
    var feedContents: String = ""
    var feedImage: String?
    var feedLikeNum: Int = 0
    var feedCommentNum: Int = 0
    var feedPostedDate: String = ""
    var feedWritedBlogger: String = ""
}
