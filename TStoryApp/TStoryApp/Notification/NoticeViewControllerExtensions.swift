//
//  FeedViewControllerExtension.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/28.
//

import UIKit

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if noticeModel.noticeCategory[selectedCategoryIndex].noticeCell.isEmpty {
                return 1
            }
            
            guard noticeModel.noticeCategory.count > selectedCategoryIndex else { return 0 }
            return noticeModel.noticeCategory[selectedCategoryIndex].noticeCell.count
        }
        else {
            return 0
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        navigationBarView.viewTitleLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor).isActive = true
        navigationBarView.viewTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: 20).isActive = true
        if yPosition >= 80 {
            navigationBarView.viewTitleLabel.text = "알림"
            navigationBarView.viewTitleLabel.textColor = .black
        }
        else {
            navigationBarView.viewTitleLabel.textColor = .clear
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if noticeModel.noticeCategory[selectedCategoryIndex].noticeCell.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "feed_null_cell", for: indexPath) as! NoticeIsNullTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else {
            let data = noticeModel.noticeCategory[selectedCategoryIndex].noticeCell[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! NoticeTableViewCell
            cell.commentNoticeLabel.text = data.cellTitle
            cell.commentContentLabel.text = data.cellContent
            cell.commentWritedPersonLabel.text = data.cellFeedSender
            cell.commentWritedDateLabel.text = data.cellFeedDate
            cell.setProfileViewColorFunc(index: indexPath.row)
            cell.cellDividedLine.isHidden = indexPath.row == noticeModel.noticeCategory[selectedCategoryIndex].noticeCell.count - 1
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "feed_header") as? NoticeTableViewHeader
            header?.setNoticeButton(text: noticeModel.noticeCategory[selectedCategoryIndex].categoryName)
            header?.noticeButton.addTarget(self, action: #selector(noticeTitleDidTapped), for: .touchUpInside)
            return header
        }
        else {
            return nil
        }
    }
    
    @objc func noticeTitleDidTapped(button: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = CategoryKindViewController(categories: noticeModel.noticeCategory)
        vc.delegate = self
//        vc.view.layer.zPosition = 0
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
}


extension NoticeViewController: CategoryKindViewControllerDelegate {
    func categoryDidTapped(_ viewController: CategoryKindViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        
        guard let at = at else { return }
        selectedCategoryIndex = at
        for i in 0 ..< noticeModel.noticeCategory.count {
            noticeModel.noticeCategory[i].isSelected = false
        }
        noticeModel.noticeCategory[at].isSelected = true
        feedView.reloadData()
    }
}


extension NoticeViewController: MyBlogOfProfileViewControllerDelegate {
    func profileStackViewDidTapped(viewController: MyBlogOfProfileViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: false, completion: {
            if at == 0 {
                let accountSettingViewController = AccountSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
                accountSettingViewController.modalPresentationStyle = .fullScreen
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController?.present(accountSettingViewController, animated: true, completion: nil)
            }
            else if at == 1 {
                let settingViewController = SettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
                settingViewController.modalPresentationStyle = .fullScreen
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController?.present(settingViewController, animated: true, completion: nil)
            }
            else {
                return
            }
        })
    }
}


extension NoticeViewController: BlogSearchViewControllerDelegate {
    func dismissBlogSearchViewController(model: BlogSearchModel) {
        self.blogSearchModel = model
    }
}

extension NoticeViewController: SettingViewControllerDelegate {
    func getMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = model
    }
}

extension NoticeViewController: AccountSettingViewControllerDelegate {
    func getProflieName(name: String) {
        self.myBlogOfProfileModel.profileName = name
    }
}
