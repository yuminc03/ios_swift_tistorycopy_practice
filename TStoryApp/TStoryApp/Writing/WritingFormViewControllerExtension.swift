//
//  WritingFormViewControllerExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/29.
//

import UIKit

extension WritingFormViewController: PublishingSettingDelegate {//블로그 제목, 블로그 태그, 카테고리 종류, 공개설정 index, 발행일 index, 댓글 허용 여부
    
    func dismissSettingView(_ controller: PublishingSettingViewController, writeTitleText: String, publishTagText: String, categoryText: String, openSettingTextIndex: Int, publishDateIndex: Int, allowComment: Bool, passWordText: String) {
        writingFormView.setTitleTextViewText(titleText: writeTitleText)
        setPublishTagText(tag: publishTagText)
        setCategoryText(category: categoryText)
        setOpenSettingIndex(index: openSettingTextIndex)
        setPublishDateIndex(index: publishDateIndex)
        setAllowComment(allow: allowComment)
        setPassWordLabel(passWord: passWordText)
        controller.dismiss(animated: true, completion: nil)
    }
}

