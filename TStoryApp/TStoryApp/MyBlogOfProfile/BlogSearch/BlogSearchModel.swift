//
//  BlogSearchModel.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

struct BlogSearchModel {
    var searchResultModal: [SearchResultModel] = []
    
}

struct SearchResultModel {//검색어
    var searchWords: String = ""
    var searchDate: String = ""
}
