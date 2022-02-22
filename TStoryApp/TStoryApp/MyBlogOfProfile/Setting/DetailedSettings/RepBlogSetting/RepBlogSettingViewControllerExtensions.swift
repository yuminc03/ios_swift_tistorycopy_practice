//
//  RepBlogSettingViewControllerExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/19.
//

import UIKit

extension RepBlogSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myBlogOfProfileModel.myBlogsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = myBlogOfProfileModel.myBlogsModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "rep_blog_setting_cell") as! RepBlogSettingTableViewCell
        cell.backgroundColor = .white
        cell.setRepBlogSettingTableViewCell(blogName: data.blogName, blogUrl: data.blogUrl)
        cell.repMarkLabel.isHidden = data.blogName != myBlogOfProfileModel.repBlogName
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "rep_blog_setting_header") as! RepBlogSettingTableViewHeader
        header.dismissRepBlogSettingButton.addTarget(self, action: #selector(dismissRepBlogSettingButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    @objc private func dismissRepBlogSettingButtonDidTapped(button: UIButton){
        self.dismiss(animated: true)
    }

}
