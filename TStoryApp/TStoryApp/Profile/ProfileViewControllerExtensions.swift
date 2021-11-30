//
//  ProfileViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 0 }
        else {
//            print(profileModel.category[selectedCateogoryIndex])
            // edge case
            guard profileModel.category.count > selectedCateogoryIndex else { return 0 }
            return profileModel.category[selectedCateogoryIndex].categoryCell.count
        }
//        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        navigationBarView.viewTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: 20).isActive = true
        navigationBarView.viewTitleLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor).isActive = true
        if yPosition >= 350 {
            navigationBarView.backgroundColor = .white
            navigationBarView.blogSearchButton.setTitleColor(.black, for: .normal)
            navigationBarView.viewTitleLabel.text = "천천히 해도 괜찮아"
            navigationBarView.viewTitleLabel.textColor = .black
        }
        else {
            navigationBarView.backgroundColor = .clear
            navigationBarView.blogSearchButton.setTitleColor(.white, for: .normal)
            navigationBarView.viewTitleLabel.textColor = .clear
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
        let data = profileModel.category[selectedCateogoryIndex].categoryCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "my_contents", for: indexPath) as! MyContentTableViewCell
        cell.setComponentNumberData(likeNum: data.cellLikeNum, commentNum: data.cellCommentNum)
        cell.setTableViewCellData(title: data.cellTitle, date: data.cellDate)
        cell.setBackgroundColor(index: indexPath.row)
        cell.cellDividedLine.isHidden = indexPath.row == profileModel.category[selectedCateogoryIndex].categoryCell.count - 1
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if section == 0 { return 10 }
//        else { return 0 }
        return section == 0 ? 10 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profile_header") as? ProfileTableViewHeader
            header?.titleLabel.text = profileModel.profileTitle
            header?.siteUrlButton.setTitle(profileModel.profileUrl, for: .normal)
            let text = "구독자 " + "\(profileModel.subscribeNum)"
            let mutable = NSMutableAttributedString(string: text)//text의 색깔을 바꾼다
            let range = (text as NSString).range(of: "\(profileModel.subscribeNum)")
            mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)//1개만
            header?.subscribeLabel.attributedText = mutable
            header?.profileUrl = "https://dpffldk.tistory.com"
            return header
        }
        else if section == 1 {
            let myContentHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "my_content_header") as? MyContentTableViewHeader
            let gesture = UITapGestureRecognizer(target: self, action: #selector(titleLabelDidTapped))
            myContentHeader?.titleLabel.addGestureRecognizer(gesture)
            myContentHeader?.titleLabel.isUserInteractionEnabled = true
            myContentHeader?.setTitle(text: profileModel.category[selectedCateogoryIndex].categoryName)
            return myContentHeader
        }
        else {
            return nil
        }
    }
    
    @objc private func titleLabelDidTapped(gesture: UIGestureRecognizer) {
        tabBarController?.tabBar.isHidden = true
        let vc = CategoryKindPopoverViewController(categories: profileModel.category)
        vc.delegate = self
//        vc.getData(categories: profileModel.category)
//        vc.view.layer.zPosition = 0
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }

}

extension ProfileViewController: CategoryKindPopoverViewControllerDelegate {
    func categoryDidTapped(_ viewController: CategoryKindPopoverViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let at = at else { return }//at이 null값이 아닐 때만 밑의 로직을 실행
        selectedCateogoryIndex = at
        for i in 0 ..< profileModel.category.count {
            profileModel.category[i].isSelected = false
        }
        profileModel.category[at].isSelected = true
        
        profileView.reloadData()
    }
}

extension ProfileViewController: MyBlogOfProfileViewControllerDelegate {
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

extension ProfileViewController: BlogSearchViewControllerDelegate {
    func dismissBlogSearchViewController(model: BlogSearchModel) {
        self.blogSearchModel = model
    }
}

extension ProfileViewController: SettingViewControllerDelegate {
    func getMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = model
    }
}

extension ProfileViewController: AccountSettingViewControllerDelegate {
    func getProflieName(name: String) {
        self.myBlogOfProfileModel.profileName = name
    }
}
