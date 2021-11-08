//
//  PostContentsTagSettingViewExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/04.
//

import UIKit

extension PostContentsTagSettingView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if tagInputTextField.textColor == .lightGray.withAlphaComponent(0.8) {
            tagInputTextField.text = "#"
            tagInputTextField.textColor = .black
        }
        else {
            tagInputTextField.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if tagInputTextField.text == nil {
            tagInputTextField.text = tagInputTextPlaceHolder
            tagInputTextField.textColor = .lightGray.withAlphaComponent(0.8)
        }
    }
}
