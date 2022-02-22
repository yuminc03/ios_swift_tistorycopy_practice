//
//  SubscriberTableViewCell.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/11.
//

import UIKit

class SubscriberTableViewCell: UITableViewCell {
    
    var subscriberModel: [SubscriberModel] = []
    
    lazy var subscriberCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SubscriberCollectionViewCell.self, forCellWithReuseIdentifier: "subscriber_collection_cell")
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
            subscriberCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subscriberCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subscriberCollectionView.topAnchor.constraint(equalTo: topAnchor),
            subscriberCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setSubscriberModel(model: [SubscriberModel]) {
        self.subscriberModel = model
    }
}
