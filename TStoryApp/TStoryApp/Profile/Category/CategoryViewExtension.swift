//
//  CategoryViewExtension.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/29.
//

import UIKit

extension CategoryKindPopoverViewController: CategoryViewDelegate {
    
    func categoryDidTapped(at index: Int) {
        delegate?.categoryDidTapped(self, at: index)
    }
}
