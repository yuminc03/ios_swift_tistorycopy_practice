//
//  SettingViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/19.
//

import UIKit

extension SettingViewController: SettingStackViewDelegate {
    func stackViewCellDidTapped(at: Int, pageTitle: String) {
        switch at {
        case 0:
            let vc = AccountSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        case 1:
            let vc = RepBlogSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        case 2:
            let vc = NotificationSettingViewController(notificationModel: self.myBlogOfProfileModel.notificationModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        case 3:
            let vc = AnnouncementViewController(announcementModel: self.myBlogOfProfileModel.announcementModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        case 4:
            let vc = AppInformationViewController(myBlogOfProfileModal: self.myBlogOfProfileModel)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        case 5, 6, 7, 8, 9:
            let vc = OtherContentsViewController(title: pageTitle)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true);
        default:
            return
        }
    }
}
