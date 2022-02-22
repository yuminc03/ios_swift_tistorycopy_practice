//
//  BlogSearchViewControllerExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/23.
//

import UIKit

extension BlogSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.keyboardType = .webSearch
    }
}
