//
//  BlogSettingViewControllerExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/22.
//

import UIKit

extension BlogSettingViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        blogNameTextCount = blogNameTextField.text?.count ?? 0
        blogNameTextCountLabel.text = "\(blogNameTextCount) / 40"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == blogNameTextField {
            guard let text = textField.text else { return true }
            let newText = (text as NSString).replacingCharacters(in: range, with: string)
            let numberOfChars = newText.count
            return numberOfChars <= 40
        }
        else {
            
            return true
        }
    }
}

extension BlogSettingViewController: BlogImageSettingCategoryViewControllerDelegate {
    
    func stackViewBlockDidTapped(tag: Int?, controller: UIViewController?) {
        
        if tag == 0 {
            
            controller?.dismiss(animated: true, completion: {

                self.imagePickerService.checkPhotoAuthStatus()
            })
        }
        else if tag == 1 {
            
            controller?.dismiss(animated: true, completion: {

                self.blogImageView.image = nil
            })
        }
    }
    
    func backgroundDidTapped(controller: UIViewController?) {
        
        controller?.dismiss(animated: true, completion: nil)
    }
    
}

extension BlogSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        if let image = imagePickerService.getImagePickerInfo(picker: picker, info: info) {
            
            self.blogImageView.image = image
            if delegate != nil {
                
                delegate?.blogSettingViewControllerDismiss(bgImage: image)
            }
        }
    }
}
