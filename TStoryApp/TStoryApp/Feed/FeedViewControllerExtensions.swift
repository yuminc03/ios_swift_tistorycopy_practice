//
//  FeedViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/10.
//

import UIKit

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedModel.feedCell.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "feed_header") as! FeedTableViewHeader
            header.setSubscribeNumData(subscribingNum: feedModel.subscribingNum, subscriberNum: feedModel.subscriberNum)
            return header
        }
        else {
            return nil
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = feedModel.feedCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! FeedTableViewCell
        cell.selectionStyle = .none
        cell.setFeedTableViewCellData(title: data.feedTitle, contents: data.feedContents, date: data.feedPostedDate, name: data.feedWritedBlogger)
        cell.setNumberComponentText(likeNum: data.feedLikeNum, commentNum: data.feedCommentNum)
        cell.feedImageView.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.1)
        cell.seperator.isHidden = indexPath.row == feedModel.feedCell.count - 1
        return cell
    }

}
