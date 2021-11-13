//
//  HomeModel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//


struct HomeModel {
    var topContents: String = ""
    var visitModel: [VisitModel] = []
    var recentlyModel: [RecentlyModel] = []
    var popularityModel: [PopularityModel] = []
    var subscriberModel: [SubscriberModel] = []
}

struct VisitModel {
    var blogName: String = ""
    var blogUrl: String = ""
    var visitCell: [VisitCell] = []
}

struct VisitCell {
    var visitInfo: [VisitInformation] = []
    var visitKeyWords: [VisitKeyWords] = []
}

struct VisitInformation {
    var visitUrl: String = ""
    var visitDate: String = ""
}

struct VisitKeyWords {
    var visitKeyWord: String = ""
    var keyWordCount: Int = 0
}

struct RecentlyModel {
    var postName: String = ""
    var postUrl: String = ""
    var likeNum: Int = 0
    var commentNum: Int = 0
}

struct PopularityModel {
    var postName: String = ""
    var postImageName: String = ""
    var postViewsNum: Int = 0
}

struct SubscriberModel {
    var subscriberName: String = ""
    var blogName: String = ""
    var backgroundImageName: String = ""
    var profileImageName: String = ""
}
