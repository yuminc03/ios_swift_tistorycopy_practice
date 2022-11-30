//
//  PopularityPostSeeAllViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/14.
//

import UIKit

class PoopularityPostSeeAllViewController: UIViewController {
    
    var popularityModel : [PopularityModel] = []
    
    lazy var popularityPostSeeAllTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PopularityPostSeeAllTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "popularity_see_all_header")
        tableView.register(PopularityPostSeeAllTableViewCell.self, forCellReuseIdentifier: "popularity_see_all_cell")
        view.addSubview(tableView)
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            popularityPostSeeAllTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularityPostSeeAllTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popularityPostSeeAllTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            popularityPostSeeAllTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setPopularityModel(model: [PopularityModel]){
        self.popularityModel = model
    }
}
