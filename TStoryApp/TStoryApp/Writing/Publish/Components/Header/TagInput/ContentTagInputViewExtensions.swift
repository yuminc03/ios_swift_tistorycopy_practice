//
//  ContentTagInputViewExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/08.
//

import UIKit

extension ContentTagInputView: UITextFieldDelegate {
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
