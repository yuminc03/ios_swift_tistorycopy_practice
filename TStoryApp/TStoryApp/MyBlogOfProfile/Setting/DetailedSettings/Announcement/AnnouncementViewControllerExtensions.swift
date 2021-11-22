//
//  AnnouncementViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

extension AnnouncementViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementModel.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "announcement_header") as! AnnouncementTableViewHeader
        header.dismissAnnouncementTableViewButton.addTarget(self, action: #selector(dismissAnnouncementTableViewButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = announcementModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcement_cell") as! AnnouncementTableViewCell
        cell.setAnnouncementTableViewCell(title: data.announceTitle, likeNum: data.announceLikeNum, commentNum: data.announceCommentNum, date: data.announceDate)
        cell.announcementImageView.backgroundColor = .systemTeal.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.15)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc private func dismissAnnouncementTableViewButtonDidTapped(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
