//
//  VisitTableViewCellExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

extension VisitTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return visitModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_collection_cell", for: indexPath) as! VisitCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.borderWidth = 0.1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowRadius = 4
        
        if indexPath.row == 0 {
            cell.tag = 0
            cell.cellIndexIsZero()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 40), height: 240) //width = 350.0
    }

}
