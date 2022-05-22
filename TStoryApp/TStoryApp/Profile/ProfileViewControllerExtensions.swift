//
//  ProfileViewControllerExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/26.
//

import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        navigationBarView.viewTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: 20).isActive = true
        navigationBarView.viewTitleLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor).isActive = true
        if yPosition >= 250 {
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
 
        let data = viewModel.profileModel.category[viewModel.selectedCateogoryIndex].categoryCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "my_contents", for: indexPath) as! MyContentTableViewCell
        cell.setComponentNumberData(likeNum: data.cellLikeNum, commentNum: data.cellCommentNum)
        cell.setTableViewCellData(title: data.cellTitle, date: data.cellDate)
        cell.setBackgroundColor(index: indexPath.row)
        cell.cellDividedLine.isHidden = indexPath.row == viewModel.profileModel.category[viewModel.selectedCateogoryIndex].categoryCell.count - 1
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat(viewModel.heightForFooterInSection(section: section))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return viewModel.viewForFooterInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
//            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profile_header") as? ProfileTableViewHeader
//            header?.titleLabel.text = viewModel.profileModel.profileTitle
//            header?.siteUrlButton.setTitle(viewModel.profileModel.profileUrl, for: .normal)
//            let text = "구독자 " + "\(viewModel.profileModel.subscribeNum)"
//            let mutable = NSMutableAttributedString(string: text)//text의 색깔을 바꾼다
//            let range = (text as NSString).range(of: "\(viewModel.profileModel.subscribeNum)")
//            mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)//1개만
//            header?.subscribeLabel.attributedText = mutable
//            header?.profileUrl = "https://dpffldk.tistory.com"
//            return header
//        }
//        else if section == 1 {
            let myContentHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "my_content_header") as? MyContentTableViewHeader
            let gesture = UITapGestureRecognizer(target: self, action: #selector(titleLabelDidTapped))
            myContentHeader?.titleLabel.addGestureRecognizer(gesture)
            myContentHeader?.titleLabel.isUserInteractionEnabled = true
            myContentHeader?.setTitle(text: viewModel.profileModel.category[viewModel.selectedCateogoryIndex].categoryName)
            return myContentHeader
        }
        else {
            return nil
        }
    }
    
    @objc private func titleLabelDidTapped(gesture: UIGestureRecognizer) {
        tabBarController?.tabBar.isHidden = true
        let vc = CategoryKindPopoverViewController(categories: viewModel.profileModel.category)
        vc.delegate = self
//        vc.getData(categories: profileModel.category)
//        vc.view.layer.zPosition = 0
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: false)
    }

}

extension ProfileViewController: CategoryKindPopoverViewControllerDelegate {
    func categoryDidTapped(_ viewController: CategoryKindPopoverViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let at = at else { return }//at이 null값이 아닐 때만 밑의 로직을 실행
        viewModel.selectedCateogoryIndex = at
        for i in 0 ..< viewModel.profileModel.category.count {
            viewModel.profileModel.category[i].isSelected = false
        }
        viewModel.profileModel.category[at].isSelected = true
        
        profileTableView.reloadData()
    }
}

extension ProfileViewController: MyBlogOfProfileViewControllerDelegate {
    func profileStackViewDidTapped(viewController: MyBlogOfProfileViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: false, completion: {
            if at == 0 {
                let accountSettingViewController = AccountSettingViewController(myBlogOfProfileModel: self.viewModel.myBlogOfProfileModel)
                accountSettingViewController.modalPresentationStyle = .fullScreen
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController?.present(accountSettingViewController, animated: true, completion: nil)
            }
            else if at == 1 {
                let settingViewController = SettingViewController(myBlogOfProfileModel: self.viewModel.myBlogOfProfileModel)
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
        viewModel.blogSearchModel = model
    }
}

extension ProfileViewController: SettingViewControllerDelegate {
    func getMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        viewModel.myBlogOfProfileModel = model
    }
}

extension ProfileViewController: AccountSettingViewControllerDelegate {
    func getProflieName(name: String) {
        viewModel.myBlogOfProfileModel.profileName = name
    }
}

extension ProfileViewController: BlogSettingViewControllerDelegate {
    
    func blogSettingViewControllerDismiss(bgImage: UIImage?) {
        
        
    }

}
