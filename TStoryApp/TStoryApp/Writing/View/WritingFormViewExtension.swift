//
//  WritingFormViewExtension.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/01.
//

import UIKit

extension WritingFormView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView === titleTextView {
            if titleTextView.textColor == .lightGray.withAlphaComponent(0.8) {
                titleTextView.text = nil
                titleTextView.textColor = .black
            }
            else {
                titleTextView.textColor = .black
            }
        }
        else if textView === contentsTextView {
            if contentsTextView.textColor == .lightGray.withAlphaComponent(0.8) {
                contentsTextView.text = nil
                contentsTextView.textColor = .black
            }
            else {
                contentsTextView.textColor = .black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if titleTextView.text.isEmpty {//text가 입력된게 없음
            titleTextView.text = titleTextPlaceHolder
            titleTextView.textColor = .lightGray.withAlphaComponent(0.8)
        }
        else if contentsTextView.text.isEmpty {
            contentsTextView.text = contentsTextPlaceHolder
            contentsTextView.textColor = .lightGray.withAlphaComponent(0.8)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView === titleTextView {
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            let numberOfChars = newText.count
            return numberOfChars <= 80
        }
        else {
            return true
        }
    }
}
