//
//  HomeSubjectModel.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/09.
//

struct HomeSubjectModel {
    var homeSubjectHeader: [HomeSubjectHeader] = []
}

struct HomeSubjectHeader {
    var homeSubjectTitle: String = ""
    var homeSubjectCategory: [HomeSubjectCell] = []
}

struct HomeSubjectCell {
    var homeSubjectName: String = ""
}
