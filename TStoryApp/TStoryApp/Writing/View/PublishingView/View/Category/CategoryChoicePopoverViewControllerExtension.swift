//
//  CategoryChoicePopoverViewControllerExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/02.
//

import UIKit

extension CategoryChoicePopoverViewController: CategoryChoicePopoverViewDelegate {
    func categoryDidTapped(name labelText: String) {
        delegate?.categoryDidTapped(self, name: labelText)
        print(labelText)
        setCategoryText(text: labelText)
    }
}
