//
//  PostContentsTagSettingViewControllerExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/03.
//

import UIKit

extension PostContentsTagSettingViewController: PostContentsTagSettingViewControllerDelegate {
    
    func postContentsTagSettingViewControllerDismiss(_ viewController: PostContentsTagSettingViewController, text: String) {
        viewController.dismiss(animated: true)
    }
}
