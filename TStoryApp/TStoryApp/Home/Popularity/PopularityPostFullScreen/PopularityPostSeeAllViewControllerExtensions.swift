//
//  PopularityPostSeeAllViewControllerExtensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/14.
//

import UIKit

extension PoopularityPostSeeAllViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularityModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = popularityModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "popularity_see_all_cell", for: indexPath) as! PopularityPostSeeAllTableViewCell
        cell.setPopularityPostSeeAll(rank: indexPath.row + 1, title: data.postName, views: data.postViewsNum)
        cell.postImageView.backgroundColor = .systemPurple.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "popularity_see_all_header") as! PopularityPostSeeAllTableHeaderView
        header.backToControllerButton.addTarget(self, action: #selector(backToControllerButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    @objc private func backToControllerButtonDidTapped(button: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
}
