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
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_num_collection_cell", for: indexPath) as! VisitNumGraphCollectionViewCell
            cell.setVisitNumWeek(model: visitModel[0].visitCell[0].todayVisitNumber[0].visitNumWeek)
            cell.setVisitNumberComponents()
            cell.visitGraphView.setSubVisitNumWeek(arr: visitModel[0].visitCell[0].todayVisitNumber[0].visitNumWeek)
            cell.visitGraphView.graphBottomLineDraw()
            cell.setCellStyle()
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_log_collection_cell", for: indexPath) as! VisitLogCollectionViewCell
            cell.setVisitInfoModel(model: visitModel[0].visitCell[0].visitInfo)
            cell.setCellStyle()
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "visit_key_collection_cell", for: indexPath) as! VisitKeyWordCollectionViewCell
            cell.setVisitKeyWords(model: visitModel[0].visitCell[0].visitKeyWords)
            cell.setCellStyle()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 { //유입 로그 모두 보기
            let vc = VisitLogViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.setVisitInfo(model: visitModel[0].visitCell[0].visitInfo)
            self.window?.rootViewController!.present(vc, animated: true)
        }
        else if indexPath.row == 2 { //유입 키워드 모두 보기
            let vc = VisitKeyWordViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.setVisitKeyWords(model: visitModel[0].visitCell[0].visitKeyWords)
            self.window?.rootViewController!.present(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 40), height: 240) //width = 350.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {//collectionView paging
        if let cv = scrollView as? UICollectionView {
            let layout = cv.collectionViewLayout as! UICollectionViewFlowLayout
            let collectionCellWidth = self.bounds.width - 40 + layout.minimumLineSpacing
            var offset = targetContentOffset.pointee //이동한 index 계산
            let index = round((offset.x + cv.contentInset.left) / collectionCellWidth)//반올림 하기 때문에 스크롤이 페이지 중간을 넘어가지 않으면 paging이 되지 않음
            
            if index > currentPageIndex {
                currentPageIndex += 1
            }
            else if index < currentPageIndex {
                if currentPageIndex != 0 {
                    currentPageIndex -= 1
                }
            }
            print(Int(currentPageIndex))
            
            offset = CGPoint(x: currentPageIndex * collectionCellWidth - cv.contentInset.left, y: 0)
            targetContentOffset.pointee = offset
        }
    }

}
