//
//  MyBlogOfProflieViewControllerExtensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/19.
//

import UIKit

extension MyBlogOfProfileViewController: MyBlogOfProfileViewDelegate {
    func profileStackViewDidTapped(at: Int) {
        delegate?.profileStackViewDidTapped(viewController: self, at: at)
    }
}
