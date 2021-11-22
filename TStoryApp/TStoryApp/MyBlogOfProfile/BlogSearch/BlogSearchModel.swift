//
//  BlogSearchModel.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/22.
//

struct BlogSearchModel {
    var searchResultModal: [SearchResultModel] = []
    
}

struct SearchResultModel {//검색어
    var searchWords: String = ""
    var searchDate: String = ""
}
