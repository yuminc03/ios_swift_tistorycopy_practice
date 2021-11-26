//
//  VisitTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class VisitTableViewCell: UITableViewCell {
    
    var visitModel = VisitModel()
    var currentPageIndex: CGFloat = 0 //보여줄 페이지의 시작
    
    lazy var visitingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 25, left: 20, bottom: 5, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VisitNumGraphCollectionViewCell.self, forCellWithReuseIdentifier: "visit_num_collection_cell")
        collectionView.register(VisitLogCollectionViewCell.self, forCellWithReuseIdentifier: "visit_log_collection_cell")
        collectionView.register(VisitKeyWordCollectionViewCell.self, forCellWithReuseIdentifier: "visit_key_collection_cell")
        contentView.addSubview(collectionView)
        return collectionView
    } ()
    
    lazy var myBlogUrlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        addSubview(label)
        return label
    } ()
    
    lazy var currentPageViewFirst: VisitCellComponentsView = {
        let currentPageView = VisitCellComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 2
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        currentPageView.tag = 0
        addSubview(currentPageView)
        return currentPageView
    } ()
    
    lazy var currentPageViewSecond: VisitCellComponentsView = {
        let currentPageView = VisitCellComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 2
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        currentPageView.tag = 1
        addSubview(currentPageView)
        return currentPageView
    } ()
    
    lazy var currentPageViewThird: VisitCellComponentsView = {
        let currentPageView = VisitCellComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 2
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        currentPageView.tag = 2
        addSubview(currentPageView)
        return currentPageView
    } ()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.isUserInteractionEnabled = true //contentView가 가장 위에 덮혀있기 때문에.. 꼭 설정해주자!
        setConstraints()
        currentPageViewFirst.setUI(isSelected: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            myBlogUrlLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myBlogUrlLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewFirst.trailingAnchor.constraint(equalTo: currentPageViewSecond.leadingAnchor, constant: -5),
            currentPageViewFirst.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewSecond.trailingAnchor.constraint(equalTo: currentPageViewThird.leadingAnchor, constant: -5),
            currentPageViewSecond.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewThird.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currentPageViewThird.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            visitingCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            visitingCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            visitingCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            visitingCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    
    }
    
    var selectedView: VisitCellComponentsView?
    
    func initalizeComponent() {
        currentPageViewFirst.setUI(isSelected: false)
        currentPageViewSecond.setUI(isSelected: false)
        currentPageViewThird.setUI(isSelected: false)
    }
    
    func setPageNumber(index : CGFloat){
        self.currentPageViewSetting(index: index)
    }
    
    func currentPageViewSetting(index: CGFloat) {
        self.currentPageIndex = index
        initalizeComponent()
        
        if index == 0 {
            selectedView = currentPageViewFirst
        }
        else if index == 1 {
            selectedView = currentPageViewSecond
        }
        else {
            selectedView = currentPageViewThird
        }
        selectedView?.setUI(isSelected: true)
    }
    func setBlogUrl(url: String) {
        self.myBlogUrlLabel.text = url
    }
    
    func setVisitModel(model: VisitModel) {
        self.visitModel = model
    }
    
    func getCurrentPage() -> CGFloat {
        return self.currentPageIndex
    }
}
