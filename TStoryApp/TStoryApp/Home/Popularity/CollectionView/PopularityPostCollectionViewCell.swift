//
//  PopularityPostCollectionViewCell.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/12.
//

import UIKit

class PopularityPostCollectionViewCell: UICollectionViewCell {
    
    var popularityModel: [PopularityModel] = []
    
    lazy var popularityPostTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PopularityPostTableViewCell.self, forCellReuseIdentifier: "popularity_post_cell")
        addSubview(tableView)
        return tableView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            popularityPostTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            popularityPostTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            popularityPostTableView.topAnchor.constraint(equalTo: topAnchor),
            popularityPostTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setPopularityModel(model: [PopularityModel]) {
        self.popularityModel = model
    }
}
