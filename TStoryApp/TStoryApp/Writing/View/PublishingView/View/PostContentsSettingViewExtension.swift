//
//  PostContentsSettingViewExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/03.
//

import UIKit

extension PostContentsSettingView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //키보드 입력완료 버튼 누르면 키보드 사라지게 하기
        textField.resignFirstResponder()
        return true
    }
}
