//
//  RecentlyTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class RecentlyTableViewCell: UITableViewCell {
    
    var recentlyModel: [RecentlyModel] = []
    
    lazy var RecentlyPostCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
//        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecentlyPostCollectionViewCell.self, forCellWithReuseIdentifier: "recently_collection_cell")
        contentView.addSubview(collectionView)
        return collectionView
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            RecentlyPostCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            RecentlyPostCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            RecentlyPostCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            RecentlyPostCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setRecentlyModel(model: [RecentlyModel]) {
        self.recentlyModel = model
    }
}
