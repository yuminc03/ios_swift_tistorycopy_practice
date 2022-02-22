//
//  LogSortViewControllerExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/16.
//

import UIKit

extension LogSortViewController: LogSortViewDelegate {
    func LogSortViewDidTapped(at index: Int) {
        delegate?.LogSortViewDidTapped(self, at: index)
        self.isSelected = index
    }
}
