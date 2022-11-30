//
//  PublishSettingHeaderViewExtensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/07.
//

import UIKit

extension PublishSettingHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //키보드 입력완료 버튼 누르면 키보드 사라지게 하기
        textField.resignFirstResponder()
        return true
    }
}

