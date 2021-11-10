//
//  HomeSubjectModel.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/09.
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
