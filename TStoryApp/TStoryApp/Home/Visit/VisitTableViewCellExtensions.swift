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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_num_collection_cell", for: indexPath) as! VisitNumGraphCollectionViewCell
            cell.setVisitNumWeek(model: visitModel.visitCell.todayVisitNumber[0].visitNumWeek)
            cell.setVisitNumberComponents()
            cell.visitGraphView.setSubVisitNumWeek(arr: visitModel.visitCell.todayVisitNumber[0].visitNumWeek)
            cell.visitGraphView.graphBottomLineDraw()
            cell.setCellStyle()
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_log_collection_cell", for: indexPath) as! VisitLogCollectionViewCell
            cell.setVisitInfoModel(model: visitModel.visitCell.visitInfo)
            cell.setCellStyle()
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_key_collection_cell", for: indexPath) as! VisitKeyWordCollectionViewCell
            cell.setVisitKeyWords(model: visitModel.visitCell.visitKeyWords)
            cell.setCellStyle()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = VisitNumGraphFullScreenViewController(visitCell: visitModel.visitCell)
            vc.modalPresentationStyle = .fullScreen
            self.window?.rootViewController!.present(vc, animated: true)
        }
        else if indexPath.row == 1 { //?????? ?????? ?????? ??????
            let vc = VisitLogViewController(visitInfo: visitModel.visitCell.visitInfo)
            vc.modalPresentationStyle = .fullScreen
            self.window?.rootViewController!.present(vc, animated: true)
        }
        else if indexPath.row == 2 { //?????? ????????? ?????? ??????
            let vc = VisitKeyWordViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.setVisitKeyWords(model: visitModel.visitCell.visitKeyWords)
            self.window?.rootViewController!.present(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 40), height: 220) //width = 350.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {//collectionView paging
        if let cv = scrollView as? UICollectionView {
            let layout = cv.collectionViewLayout as! UICollectionViewFlowLayout
            let collectionCellWidth = self.bounds.width - 40 + layout.minimumLineSpacing
            var offset = targetContentOffset.pointee //????????? index ??????
            let index = round((offset.x + cv.contentInset.left) / collectionCellWidth)//????????? ?????? ????????? ???????????? ????????? ????????? ???????????? ????????? paging??? ?????? ??????
            
            if index > currentPageIndex {
                currentPageIndex += 1
            }
            else if index < currentPageIndex {
                if currentPageIndex != 0 {
                    currentPageIndex -= 1
                }
            }
            setPageNumber(index: currentPageIndex)//view ?????? ?????????
            offset = CGPoint(x: currentPageIndex * collectionCellWidth - cv.contentInset.left, y: 0)
            targetContentOffset.pointee = offset
        }
    }
    
    
}
