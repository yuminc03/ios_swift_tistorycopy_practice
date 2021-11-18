//
//  MyBlogOfProfileViewExtensions.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/17.
//

import UIKit

extension MyBlogOfProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myBlogOfProfileModel.myBlogsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = myBlogOfProfileModel.myBlogsModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile_info_table_cell", for: indexPath) as! ProfileInfoTableViewCell
        cell.myBlogBackgroundImageView.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.25)
        cell.selectionStyle = .none
        cell.setProfileInfoTableViewCell(name: data.blogName)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profile_info_table_header") as! ProfileInfoTableViewHeader
        header.setProfileInfoTableViewHeader(name: myBlogOfProfileModel.profileName, email: myBlogOfProfileModel.profileEmail)
        header.accountSettingButton.addTarget(self, action: #selector(accountSettingButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profile_info_table_footer") as! ProfileInfoTableViewFooter
        footer.settingButton.addTarget(self, action: #selector(settingButtonDidTapped), for: .touchUpInside)
        return footer
    }
    
    @objc private func accountSettingButtonDidTapped(button: UIButton) {
        let vc = AccountSettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc private func settingButtonDidTapped(button: UIButton) {
        let vc = SettingViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
