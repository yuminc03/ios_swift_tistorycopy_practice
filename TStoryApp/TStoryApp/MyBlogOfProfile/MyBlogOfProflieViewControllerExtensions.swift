//
//  MyBlogOfProflieViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/19.
//

import UIKit

extension MyBlogOfProfileViewController: MyBlogOfProfileViewDelegate {
    func profileStackViewDidTapped(at: Int) {
        delegate?.profileStackViewDidTapped(viewController: self, at: at)
    }
}
