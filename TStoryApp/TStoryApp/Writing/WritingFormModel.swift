//
//  WritingFormModel.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/29.
//

struct WriteFormModel { //블로그 글쓰기 창
    var writeTitleText: String = "" //블로그 제목
    var writeContentText: String = "" //블로그 내용
    var formSaveNum: Int = 0 //임시 저장 횟수 (저장 했다면 1)
    var formSorting: Int = 0 //블로그 글 정렬 index(0 = 왼쪽정렬, 1 = 가운데 정렬, 2 = 오른쪽 정렬, 3 = 정렬 없음)
    var publishSettingForm: [PublishSettingFormModel] = [] //발행 창에 보일 데이터들
}

struct PublishSettingFormModel { //발행 창
    var publishTitleText: String = "" //발행 창의 블로그 제목(글쓰기 창의 블로그 제목과 같음)
    var publishTagText: String = "" //태그의 제목
    var publishCategoryName: String = "" //카테고리의 이름(현재 선택한 카테고리) - 선택 안 함 가능
    var publishSettingIndex: Int = 0 //공개 설정(0 = 공개, 2 = 보호, 4 = 비공개)
    var publishSubject: String = "" //홈주제 종류(collectionView, 라이프, 여행,맛집, 문화.연애, IT, 스포츠...) - 선택 안 함 가능
    var selectedDate: Int = 0 //발행일 index (0 = 현재, 1 = 예약)
    var publishDate: String = "" //발행일 날짜(현재 날짜 -> 가능하면.. 바꿀 수도 있음)
    var publishHour: String = "" //발행일 시간
    var allowComment: Bool = true //댓글 허용 switch값 (true = 허용, false = 허용 안 함)
    var protectPassWord: String = "" //보호 비밀번호 (공개 설정이 '보호' 인 경우에만 사용됨)
}
