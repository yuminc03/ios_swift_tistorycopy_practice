//
//  ChangeNaicknameViewControllerExtension.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/19.
//

import UIKit


extension ChangeNicknameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == newNicknameTextField {
            return textField.text!.count + (string.count - range.length) <= 32
        }
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.newNicknameTextFieldCounter()
    }
}
