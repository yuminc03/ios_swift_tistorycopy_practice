//
//  CategoryViewExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/29.
//

import UIKit

extension CategoryKindPopoverViewController: CategoryViewDelegate {
    
    func categoryDidTapped(at index: Int) {
        delegate?.categoryDidTapped(self, at: index)
    }
}
