//
//  PopularityTableViewCell.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//

import UIKit

class PopularityTableViewCell: UITableViewCell {
    
    var popularityModel: [PopularityModel] = []
    
    lazy var popularityPostCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PopularityPostCollectionViewCell.self, forCellWithReuseIdentifier: "popularity_collection_cell")
        addSubview(collectionView)
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
            popularityPostCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            popularityPostCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            popularityPostCollectionView.topAnchor.constraint(equalTo: topAnchor),
            popularityPostCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setPopularityModel(model: [PopularityModel]) {
        self.popularityModel = model
    }
}
