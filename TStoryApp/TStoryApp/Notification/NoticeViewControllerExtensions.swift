//
//  FeedViewControllerExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/28.
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if noticeModel.noticeCategory[selectedCategoryIndex].noticeCell.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "feed_null_cell", for: indexPath) as! NoticeIsNullTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else {
            let data = noticeModel.noticeCategory[selectedCategoryIndex].noticeCell[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! FeedTableViewCell
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
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "feed_header") as? FeedTableViewHeader
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
