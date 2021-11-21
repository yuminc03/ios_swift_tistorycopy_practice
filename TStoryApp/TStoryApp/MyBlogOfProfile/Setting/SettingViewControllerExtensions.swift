//
//  SettingViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/19.
//

import UIKit

extension SettingViewController: SettingStackViewDelegate {
    func stackViewCellDidTapped(at: Int) {
        switch at {
        case 0:
            let vc = AccountSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 1:
            let vc = RepBlogSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        default:
            return
        }
    }
}
