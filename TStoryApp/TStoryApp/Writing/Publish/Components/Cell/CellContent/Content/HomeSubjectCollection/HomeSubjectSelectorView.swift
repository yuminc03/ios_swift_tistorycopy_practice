//
//  HomeSubjectSelectorView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/09.
//

import UIKit

protocol HomeSubjectCollectionViewDelegate: AnyObject {
    func homeSubjectSelectorDidTapped(name: String?)
}
class HomeSubjectSelectorView: UIView {
    
    weak var delegate: HomeSubjectCollectionViewDelegate?
    
    lazy var titleText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "홈주제"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        addSubview(label)
        return label
    } ()
    
    lazy var homeSubjectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10 //위아래 최소 간격
        layout.minimumInteritemSpacing = 20 //양옆 최소 간격
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 30, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
//        collectionView.allowsSelection = true
        collectionView.register(HomeSubjectHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "home_subject_header")
        collectionView.register(HomeSubjectSelectorCell.self, forCellWithReuseIdentifier: "home_subject_cell")
        addSubview(collectionView)
        return collectionView
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
            titleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleText.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            homeSubjectCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homeSubjectCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            homeSubjectCollectionView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 30),
            homeSubjectCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}


//class HeaderView: UICollectionReusableView {
//
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.textColor = .black
//        label.text = "라이프"
//        addSubview(label)
//        return label
//    } ()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
//}
