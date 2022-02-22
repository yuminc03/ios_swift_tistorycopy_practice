//
//  PopularityPostCollectionViewCellExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/13.
//

import UIKit

extension PopularityPostCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( popularityModel.count >= 3 ) ? 3 : popularityModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = popularityModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "popularity_post_cell", for: indexPath) as! PopularityPostTableViewCell
        cell.postImageView.backgroundColor = .systemPurple.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.3)
        cell.setPopularityPost(rank: ( indexPath.row + 1 ), title: data.postName, views: data.postViewsNum)
        cell.separator.isHidden = ( indexPath.row == 2 )
        return cell
    }
    
    
    
}
