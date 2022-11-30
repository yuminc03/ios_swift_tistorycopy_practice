//
//  WritingFormViewControllerExtension.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/29.
//

import UIKit

//extension WritingFormViewController: PublishingSettingDelegate {//블로그 제목, 블로그 태그, 카테고리 종류, 공개설정 index, 발행일 index, 댓글 허용 여부
//
//    func dismissSettingView(_ controller: PublishingSettingViewController, writeTitleText: String, publishTagText: String, categoryText: String, openSettingTextIndex: Int, publishDateIndex: Int, allowComment: Bool, passWordText: String) {
//        writingFormView.setTitleTextViewText(titleText: writeTitleText)
//        setPublishTagText(tag: publishTagText)
//        setCategoryText(category: categoryText)
//        setOpenSettingIndex(index: openSettingTextIndex)
//        setPublishDateIndex(index: publishDateIndex)
//        setAllowComment(allow: allowComment)
//        setPassWordLabel(passWord: passWordText)
//        controller.dismiss(animated: true, completion: nil)
//    }
//}

extension WritingFormViewController: PublishSettingViewDelgate {
    func publishSettingViewControllerDismiss(_ controller: PublishSettingViewController, writeTitleText: String, sortingIndex: Int, publishTag: String, categoryName: String, publishSettingIndex: Int, homeSubject: String, publishDateIndex: Int, publishDate: String, publishHour: String, commentAllow: Bool, passwordText: String) {
        writingFormView.setTitleTextViewText(titleText: writeTitleText)
        setSortingIndex(index: sortingIndex)
        setPublishTagText(tag: publishTag)
        setCategoryText(category: categoryName)
        setOpenSettingIndex(index: publishSettingIndex)
        setHomeSubject(name: homeSubject)
        setPublishDateIndex(index: publishDateIndex)
        setAllowComment(allow: commentAllow)
        setPassWordLabel(passWord: passwordText)
        controller.dismiss(animated: true, completion: nil)
    }

}
