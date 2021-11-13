//
//  SubscriberTableViewCellExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

extension SubscriberTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subscriberModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subscriber_collection_cell", for: indexPath) as! SubscriberCollectionViewCell
        cell.backgroundColor = .lightGray.withAlphaComponent(0.3)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.borderWidth = 0.01
        cell.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = indexPath.row == 0 ? 0.5 : 0
        
        if subscriberModel[indexPath.row].blogName == "" {
            return cell
        }
        else {
            let data = subscriberModel[indexPath.row]
            cell.setConstraints()
            cell.setSubscriberData(name: data.subscriberName, blogName: data.blogName)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 50) / 2, height: (self.bounds.width - 50) / 2)
    }
    
}
