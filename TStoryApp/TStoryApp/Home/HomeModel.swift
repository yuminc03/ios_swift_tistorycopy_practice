//
//  HomeModel.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//


struct HomeModel {
    var topContents: String = ""
    var visitModel = VisitModel()
    var recentlyModel: [RecentlyModel] = []
    var popularityModel: [PopularityModel] = []
    var subscriberModel: [SubscriberModel] = []
}

struct VisitModel {
    var blogName: String = ""
    var visitCell = VisitCell()
}

struct VisitCell {
    var blogUrl: String = ""
    var todayVisitNumber: [VisitNumber] = []
    var visitInfo: [VisitInformation] = []
    var visitKeyWords: [VisitKeyWords] = []
}

struct VisitNumber {
    var visitNumWeek: [VisitNumberWeek] = []
    var visitNum: Int = 0
    var visitIncrement: Int = 0
}

struct VisitNumberWeek {
    var todayVisitCount: Int = 0
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
