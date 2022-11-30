//
//  RecentlyTableViewCellExtensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/12.
//

import UIKit

extension RecentlyTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = recentlyModel[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recently_collection_cell", for: indexPath) as! RecentlyPostCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.borderWidth = 0.01
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.8
        cell.setCommentNumLabel(title: data.postName, likeNum: data.likeNum, commentNum: data.commentNum, postUrl: data.postUrl)
        cell.postImage.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? RecentlyPostCollectionViewCell else { return }
        let postUrl = cell.postUrl
        let vc = PostWebViewController()
        vc.setPostUrl(url: postUrl)
        vc.modalPresentationStyle = .fullScreen
        self.window?.rootViewController!.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 50) / 2, height: 220)
    }
}
