//
//  VisitTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class VisitTableViewCell: UITableViewCell {
    
    var visitModel: [VisitModel] = []
    
    lazy var visitingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VisitCollectionViewCell.self, forCellWithReuseIdentifier: "visit_collection_cell")
        contentView.addSubview(collectionView)
        return collectionView
    } ()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.isUserInteractionEnabled = true //contentView가 가장 위에 덮혀있기 때문에.. 꼭 설정해주자!
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            visitingCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            visitingCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            visitingCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            visitingCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setVisitModel(model: [VisitModel]) {
        self.visitModel = model
    }
}
