//
//  HomeSubjectSelectorViewExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/09.
//

import UIKit

//extension HomeSubjectSelectorView: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return homeSubjectModel.homeSubjectHeader.count
//    }
//        
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 {
//            homeSubjectHeaderIndex = 0
//            return homeSubjectModel.homeSubjectHeader[0].homeSubjectCategory.count
//        }else if section == 1 {
//            homeSubjectHeaderIndex = 1
//            return homeSubjectModel.homeSubjectHeader[1].homeSubjectCategory.count
//        }else if section == 2 {
//            homeSubjectHeaderIndex = 2
//            return homeSubjectModel.homeSubjectHeader[2].homeSubjectCategory.count
//        }else if section == 3 {
//            homeSubjectHeaderIndex = 3
//            return homeSubjectModel.homeSubjectHeader[3].homeSubjectCategory.count
//        }else if section == 4 {
//            homeSubjectHeaderIndex = 4
//            return homeSubjectModel.homeSubjectHeader[4].homeSubjectCategory.count
//        }else if section == 5 {
//            homeSubjectHeaderIndex = 5
//            return homeSubjectModel.homeSubjectHeader[5].homeSubjectCategory.count
//        }else if section == 6 {
//            homeSubjectHeaderIndex = 6
//            return homeSubjectModel.homeSubjectHeader[6].homeSubjectCategory.count
//        }
//        else { return 0 }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let data = homeSubjectModel.homeSubjectHeader[homeSubjectHeaderIndex].homeSubjectCategory[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home_subject_cell", for: indexPath) as! HomeSubjectSelectorCell
//        cell.homeSubjectSelectorLabel.text = data.homeSubjectName
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
//        cell.backgroundColor = .white
//        
//        return cell
//    }
//    
//}

//extension HomeSubjectCollectionView: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//}
