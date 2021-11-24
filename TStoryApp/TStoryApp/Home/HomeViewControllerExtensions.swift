//
//  HomeViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "visit_cell", for: indexPath) as! VisitTableViewCell
            cell.backgroundColor = .white
            cell.setVisitModel(model: homeModel.visitModel)
            cell.setBlogUrl(url: homeModel.visitModel[0].visitCell[0].blogUrl)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recently_cell", for: indexPath) as! RecentlyTableViewCell
            cell.backgroundColor = .white
            cell.setRecentlyModel(model: homeModel.recentlyModel)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "popularity_cell", for: indexPath) as! PopularityTableViewCell
            cell.backgroundColor = .white
            cell.setPopularityModel(model: homeModel.popularityModel)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "subscriber_cell", for: indexPath) as! SubscriberTableViewCell
            cell.backgroundColor = .white
            cell.setSubscriberModel(model: homeModel.subscriberModel)
            cell.selectionStyle = .none
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section % 2 == 1) ? 260 : (indexPath.section == 2) ? 240 : 190
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let topHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "top_header") as! TopHeaderView
            topHeader.setTopContent(text: homeModel.topContents)
            return topHeader
        }
        else if section == 1 {
            let visitHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "visit_header") as! VisitTableViewHeader
            visitHeader.setVisitHeaderData(name: homeModel.visitModel[0].blogName)
            return visitHeader
        }
        else if section == 2 {
            let recentlyHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "recently_header") as! RecentlyTableViewHeader
            return recentlyHeader
        }
        else if section == 3 {
            let popularityHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "popularity_header") as! PopularityTableViewHeader
            popularityHeader.seeAllButton.addTarget(self, action: #selector(seeAllButtonDidTapped), for: .touchUpInside)
            return popularityHeader
        }
        else if section == 4 {
            let subscriberHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "subscriber_header") as! SubscriberTableViewHeader
            return subscriberHeader
        }
        else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 4 {
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "subscriber_footer") as! SubscriberTableViewFooter
            return footer
        }
        else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 4 {
            return 80
        }
        else {
            return 0
        }
    }
    
    @objc func seeAllButtonDidTapped(button: UIButton) {
//        print("tapped")
        let vc = PoopularityPostSeeAllViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.setPopularityModel(model: homeModel.popularityModel)
        self.present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: MyBlogOfProfileViewControllerDelegate {
    func profileStackViewDidTapped(viewController: MyBlogOfProfileViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: false, completion: {
            if at == 0 {
                let accountSettingViewController = AccountSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
                accountSettingViewController.delegate = self
                accountSettingViewController.modalPresentationStyle = .fullScreen
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController?.present(accountSettingViewController, animated: true, completion: nil)
            }
            else if at == 1 {
                let settingViewController = SettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
                settingViewController.delegate = self
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

extension HomeViewController: BlogSearchViewControllerDelegate {
    func dismissBlogSearchViewController(model: BlogSearchModel) {
        self.blogSearchModel = model
    }
}

extension HomeViewController: SettingViewControllerDelegate {
    func getMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = model
    }
}

extension HomeViewController: AccountSettingViewControllerDelegate {
    func getProflieName(name: String) {
        self.myBlogOfProfileModel.profileName = name
    }
}
